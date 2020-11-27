package com.mecol.dormitory.dao;

import com.mecol.dormitory.entity.Class;

import java.util.List;

public interface ClassDao {
    List<Class> getAllClasses();

    List<Class> getClassList();

    void deleteByClassId(int classId);

    Class getClassById(int classId);

    Class getClassByClassName(String className);

    void updClass(Class aclass);

    void insertClass(Class aclass);
}
