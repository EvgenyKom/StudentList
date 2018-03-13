package ru.evgkomsoft.studentlist.controller;

import ru.evgkomsoft.studentlist.model.Student;
import ru.evgkomsoft.studentlist.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class StudentController {
    private StudentService studentService;

    @Autowired(required = true)
    @Qualifier(value = "studentService")
    public void setStudentService(StudentService studentService) {
        this.studentService = studentService;
    }

    @RequestMapping(value = "students", method = RequestMethod.GET)
    public String listStudents(Model model){
        model.addAttribute("student", new Student());
        model.addAttribute("listStudents", this.studentService.listStudents());

        return "students";
    }

    @RequestMapping(value = "/students/add", method = RequestMethod.POST)
    public String addStudent(@ModelAttribute("student") Student student){
        if(student.getId() == 0){
            this.studentService.addStudent(student);
        }else {
            this.studentService.updateStudent(student);
        }
        return "redirect:/students";
    }

    @RequestMapping("/remove/{id}")
    public String removeStudent(@PathVariable("id") int id){
        this.studentService.removeStudent(id);

        return "redirect:/students";
    }

    @RequestMapping("edit/{id}")
    public String editStudent(@PathVariable("id") int id, Model model){
        model.addAttribute("student", this.studentService.getStudentById(id));
        model.addAttribute("listStudents", this.studentService.listStudents());

        return "students.";
    }

    }