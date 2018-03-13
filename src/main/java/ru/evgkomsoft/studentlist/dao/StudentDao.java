package ru.evgkomsoft.studentlist.dao;

import ru.evgkomsoft.studentlist.model.Student;

import java.util.List;

public interface StudentDao {
    void addStudent(Student student);

    void updateStudent(Student student);

    void removeStudent(int id);

    Student getStudentById(int id);

    List<Student> listStudents();
}