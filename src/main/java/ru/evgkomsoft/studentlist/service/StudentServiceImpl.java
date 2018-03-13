package ru.evgkomsoft.studentlist.service;

import ru.evgkomsoft.studentlist.dao.StudentDao;
import ru.evgkomsoft.studentlist.model.Student;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {
    private StudentDao studentDao;

    public void setStudentDao(StudentDao studentDao) {
        this.studentDao = studentDao;
    }

    @Override
    @Transactional
    public void addStudent(Student student) {
        this.studentDao.addStudent(student);
    }

    @Override
    @Transactional
    public void updateStudent(Student student) {
        this.studentDao.updateStudent(student);
    }

    @Override
    @Transactional
    public void removeStudent(int id) {
        this.studentDao.removeStudent(id);
    }

    @Override
    @Transactional
    public Student getStudentById(int id) {
        return this.studentDao.getStudentById(id);
    }

    @Override
    @Transactional
    public List<Student> listStudents() {
        return this.studentDao.listStudents();
    }
}