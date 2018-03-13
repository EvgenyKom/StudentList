<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="from" uri="http://www.springframework.org/tags/form" %>
<%@ page session="false" %>
<html>
<head>

    <script type="text/javascript">
        function toggle_visibility(id) {
            var e = document.getElementById(id);
            if(e.style.display == 'block')
                e.style.display = 'none';
            else
                e.style.display = 'block';
        }
    </script>

    <title>Students Page</title>

    <style type="text/css">
        .tg {
            border-collapse: collapse;
            border-spacing: 0;
            border-color: #ccc;
        }

        .tg td {
            font-family: Arial, sans-serif;
            font-size: 14px;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #ccc;
            color: #333;
            background-color: #fff;
        }

        .tg th {
            font-family: Arial, sans-serif;
            font-size: 14px;
            font-weight: normal;
            padding: 10px 5px;
            border-style: solid;
            border-width: 1px;
            overflow: hidden;
            word-break: normal;
            border-color: #8fa5cc;
            color: #333;
            background-color: #f06a88;
        }

        .tg .tg-4eph {
            background-color: #f9f9f9
        }
    </style>
</head>
<body>
<a href="../../index.jsp">Back to main menu</a>

<br/>
<br/>

<h1>Student List</h1>

<c:if test="${!empty listStudents}">
    <form id="table">
    <input type="button" value="Show/Hide database" onclick="toggle_visibility('div1');"/>
</form>
    <div id="div1" style="display: none">
    <table class="tg">
         <tr>
            <th width="80">ID</th>
            <th width="120">Name</th>
            <th width="60">Edit</th>
            <th width="60">Delete</th>
        </tr>
        <c:forEach items="${listStudents}" var="student">
            <tr>
                <td>${student.id}</td>
                <td>${student.studentName}</td>
                <td><a href="<c:url value='/edit/${student.id}'/>">Edit</a></td>
                <td><a href="<c:url value='/remove/${student.id}'/>">Delete</a></td>
            </tr>
        </c:forEach>
    </table>
    </div>
</c:if>


<h1>Add a Student</h1>

<c:url var="addAction" value="/students/add"/>

<form:form action="${addAction}" commandName="student">
    <table>
        <c:if test="${!empty student.studentName}">
            <tr>
                <td>
                    <form:label path="id">
                        <spring:message text="ID"/>
                    </form:label>
                </td>
                <td>
                    <form:input path="id" readonly="true" size="8" disabled="true"/>
                    <form:hidden path="id"/>
                </td>
            </tr>
        </c:if>
        <tr>
            <td>
                <form:label path="studentName">
                    <spring:message text="Name"/>
                </form:label>
            </td>
            <td>
                <form:input path="studentName"/>
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <c:if test="${!empty student.studentName}">
                    <input type="submit"
                           value="<spring:message text="Edit Student"/>"/>
                </c:if>
                <c:if test="${empty student.studentName}">
                    <input type="submit"
                           value="<spring:message text="Add Student"/>"/>
                </c:if>
            </td>
        </tr>
    </table>
</form:form>
</body>
</html>
