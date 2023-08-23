package com.fcccnt.controllers;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.fcccnt.models.Course;
import com.fcccnt.models.Student;
import com.fcccnt.services.CourseService;
import com.fcccnt.services.StudentService;

import jakarta.servlet.http.HttpSession;
import jakarta.validation.Valid;

@Controller
public class CourseController {

    @Autowired CourseService courseService;
    @Autowired StudentService studentService;



    // Create course
    @GetMapping("/classes/new")
    public String newCourse(@ModelAttribute("course") Course course){
        return "classes/new.jsp";
    }
    @PostMapping("/classes/create")
    public String createCourse(@Valid @ModelAttribute("course") Course course, BindingResult result){
        if(result.hasErrors()){
            return "classes/new.jsp";
        }
        else{
            courseService.createCourse(course);
            return "redirect:/classes";
        }
    }


    //! Read ALL
    @GetMapping("/classes")
    public String courses(Model model, HttpSession session){
        SimpleDateFormat sdf = new SimpleDateFormat("EEEE, MMM d, yyyy");
        Date date = new Date();
        model.addAttribute("date", sdf.format(date));
        
        if(session.getAttribute("userId") == null){
            return "redirect:/logout";
        }
        List <Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses);
        return "classes/classesPage.jsp";
    }

    // Read One
    @GetMapping("/classes/{id}")
    public String show(@PathVariable("id")Long id, Model model){
        Course course = courseService.getOneCourse(id);
        model.addAttribute("course", course);
        List <Student> students = studentService.getAllStudent(id);
        model.addAttribute("students", students);
        return "classes/show.jsp";
    }

    // Update
    @GetMapping("/classes/{id}/edit")
    public String edit(@PathVariable("id")Long id, Model model){
        Course course = courseService.getOneCourse(id);
        model.addAttribute("course", course);
        return "/classes/edit.jsp";
    }

    @PutMapping("/classes/{id}")
    public String update(@Valid @ModelAttribute("course")Course course, BindingResult result){
        if(result.hasErrors()){
            return "classes/edit.jsp";
        }
        else{
            courseService.updateCourse(course);
            return "redirect:/classes";
        }
    }



    // Delete
    @DeleteMapping("/classes/{id}")
    public String destroy(@PathVariable("id")Long id, HttpSession session){
        courseService.destroyClass(id);
        return "redirect:/classes";
    }

    
    // STUDENETs
    
    @GetMapping("/classes/add/student")
    public String newStudent(Model model, @ModelAttribute("student") Student student){
        model.addAttribute("courses", courseService.getAllCourses());
        return "classes/student.jsp";
    }

    @PostMapping("/classes/add/student")
    public String createStudent(Model model, @Valid @ModelAttribute("student") Student student, BindingResult result){
        if(result.hasErrors()){
            model.addAttribute("courses", courseService.getAllCourses());
            return "classes/student.jsp";
        }
        else{
            studentService.createStudent(student);
            return "redirect:/classes";
        }
    }

    @GetMapping("/classes/{id}/edit/student")
    public String editStudent(@PathVariable("id")Long id, Model model){
        Student student = studentService.getOneStudent(id);
        model.addAttribute("student", student);
        List<Course> courses = courseService.getAllCourses();
        model.addAttribute("courses", courses); 
        return "classes/editStudent.jsp";
    }

    @PutMapping("/classes/{id}/student")
    public String updateStudent(Model model, @Valid @ModelAttribute("student")Student student, BindingResult result){
        if(result.hasErrors()){
            List<Course> courses = courseService.getAllCourses();
            model.addAttribute("courses", courses);
            return "classes/editStudent.jsp";
        }
        else{
            studentService.updateStudent(student);
            return "redirect:/classes";
        }
    }
    @DeleteMapping("/student/{id}")
    public String destroyStudent(@PathVariable("id")Long id, HttpSession session){
        studentService.destroyClass(id);
        return "redirect:/classes";
    }
    
    
}
