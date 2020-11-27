package com.mecol.dormitory.service;

import com.mecol.dormitory.entity.Class;
import com.mecol.dormitory.util.ResultUtil;

import java.util.List;

public interface ClassService {
    List<Class> getAllClasses();

    ResultUtil getClassList(Integer page, Integer limit);

    void deleteByClassId(int classId);

    Class getClassById(int classId);

    Class getClassByClassName(String className);

    ResultUtil updClass(Class aclass);

    void insertClass(Class aclass);
}
