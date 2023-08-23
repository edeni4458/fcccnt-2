package com.fcccnt.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fcccnt.models.Student;
import com.fcccnt.repositories.StudentRepository;

import jakarta.validation.Valid;

@Service
public class StudentService {
    
    @Autowired StudentRepository studentRepository;

    public List<Student> getAllStudents() {
        return studentRepository.findAll();
    }

    public void createStudent(@Valid Student student) {
        studentRepository.save(student);
    }

    public Student getOneStudent(Long id) {
        Optional<Student> student = studentRepository.findById(id);
        return student.orElse(null);
    }

    public List<Student> getAllStudent(Long id) {
        return null;
    }

    public void updateStudent(@Valid Student student) {
        studentRepository.save(student);
    }

    public void destroyClass(Long id) {
        studentRepository.deleteById(id);
    }
}