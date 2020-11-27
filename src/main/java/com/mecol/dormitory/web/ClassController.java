package com.mecol.dormitory.web;

import com.mecol.dormitory.dao.StudentDao;
import com.mecol.dormitory.entity.Class;
import com.mecol.dormitory.entity.Dormitory;
import com.mecol.dormitory.entity.Student;
import com.mecol.dormitory.service.ClassService;
import com.mecol.dormitory.service.StudentService;
import com.mecol.dormitory.util.ResultUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.text.ParseException;
import java.util.List;

@Controller
@RequestMapping("/class")
public class ClassController {
    @Autowired
    private ClassService classService;
    @Autowired
    private StudentDao studentDao;

    @RequestMapping("/classList")
    public String studentList()
    {

        return "/jsp/class/classList";
    }

    @RequestMapping("/getClassList")
    @ResponseBody
    public ResultUtil getClassList(Integer page, Integer limit)
    {
        //这是带分页的查询
        return classService.getClassList(page,limit);
    }

    @RequestMapping("/delClass/{classId}")
    @ResponseBody
    public ResultUtil delClass(@PathVariable("classId")int classId){
        List<Student> studentList=studentDao.getStudentByClassId(classId);
        if(studentList.size()!=0){ //说明此班级下有学生 不能删除
            return ResultUtil.error();
        }
        else {
            classService.deleteByClassId(classId);
            return ResultUtil.ok();
        }

    }
    @RequestMapping("/editClass/{classId}")
    public String editClass(@PathVariable("classId")int classId, HttpSession session)
    {
        Class aClass=classService.getClassById(classId);
        session.setAttribute("aClass",aClass);
        return "/jsp/class/editClass";
    }

    @RequestMapping("/checkClassName/{className}")
    @ResponseBody
    public ResultUtil checkClassName(@PathVariable("className")String className)
    {
        Class aClass=classService.getClassByClassName(className);
        if(aClass!=null)
        {
            return new ResultUtil(500,"班级名称已经存在，请做标记");
        }
        return new ResultUtil(0);
    }

    @RequestMapping("/updClass")
    @ResponseBody
    public ResultUtil updClass(Class aclass)throws ParseException
    {
        //System.out.println("曹操。。。。。。");
        return classService.updClass(aclass);
    }
    @RequestMapping("/addClass")
    public String addClass()
    {
        return "/jsp/class/addClass";
    }

    @RequestMapping("/insClass")
    @ResponseBody
    public ResultUtil insClass(Class aclass)
    {

        //     System.out.println(aclass);
        try {
            classService.insertClass(aclass);
            return  ResultUtil.ok();

        }
        catch (Exception e)
        {
            e.printStackTrace();
            return new ResultUtil(500,"数据库sql等错误，请检查输出");
        }

    }

}
