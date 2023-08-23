package com.fcccnt.services;


import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fcccnt.models.Course;
import com.fcccnt.repositories.CourseRepository;

import jakarta.validation.Valid;

@Service
public class CourseService {

    @Autowired CourseRepository courseRepository;

    public void createCourse(@Valid Course course) {
        courseRepository.save(course);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Course getOneCourse(Long id) {
        Optional<Course> course = courseRepository.findById(id);
        return course.orElse(null);
    }

    public void updateCourse(@Valid Course course) {
        courseRepository.save(course);
    }

    public void destroyClass(Long id) {
        courseRepository.deleteById(id);
    }

    public void createStudent(@Valid Course course) {
        courseRepository.save(course);
    }
}