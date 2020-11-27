package com.mecol.dormitory.service;

import com.mecol.dormitory.entity.Student;
import com.mecol.dormitory.entity.StudentSearch;
import com.mecol.dormitory.util.ResultUtil;

public interface StudentService {
    ResultUtil getAllStudentList(Integer page, Integer limit, StudentSearch search);

    Student selStudentByStudentname(String username);

    void insertStudent(Student student);

    ResultUtil deleteStudentById(int id);

    Student getStudentById(int id);

    ResultUtil updateStudent(Student student);
}
