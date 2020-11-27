package com.mecol.dormitory.service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.mecol.dormitory.dao.ClassDao;
import com.mecol.dormitory.entity.Class;
import com.mecol.dormitory.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClassServiceImpl implements ClassService{

    @Autowired
    private ClassDao classDao;

    @Override
    public List<Class> getAllClasses() {
        return classDao.getAllClasses();
    }

    @Override
    public ResultUtil getClassList(Integer page, Integer limit) {
        PageHelper.startPage(page,limit);
        List<Class> classes=classDao.getClassList();
        PageInfo<Class> classPageInfo=new PageInfo<>(classes);
        ResultUtil resultUtil=new ResultUtil();
        resultUtil.setCode(0);
        resultUtil.setCount(classPageInfo.getTotal());

        resultUtil.setData(classPageInfo.getList());
        //虽然 我存在一对多关系 但不会无限循环查下去 看mapper中的解释
        //所以@ResponseBody就不会存在双向引用导致的死递归问题
        return resultUtil;
    }

    @Override
    public void deleteByClassId(int classId) {
        classDao.deleteByClassId(classId);
    }

    @Override
    public Class getClassById(int classId) {
        return classDao.getClassById(classId);
    }

    @Override
    public Class getClassByClassName(String className) {
        return classDao.getClassByClassName(className);
    }

    @Override
    public ResultUtil updClass(Class aclass) {
        try{
            classDao.updClass(aclass);
            return ResultUtil.ok();
        }
        catch (Exception e){
            e.printStackTrace();
            return ResultUtil.error();
        }
    }

    @Override
    public void insertClass(Class aclass) {
        classDao.insertClass(aclass);
    }
}
