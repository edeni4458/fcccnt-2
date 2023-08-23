package com.fcccnt.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import com.fcccnt.models.Student;

@Repository

public interface StudentRepository extends CrudRepository<Student, Long> {
    List<Student> findAll();



}