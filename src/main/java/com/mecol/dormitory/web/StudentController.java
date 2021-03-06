package com.mecol.dormitory.web;

import com.mecol.dormitory.entity.Class;
import com.mecol.dormitory.entity.Dormitory;
import com.mecol.dormitory.entity.Student;
import com.mecol.dormitory.entity.StudentSearch;
import com.mecol.dormitory.service.ClassService;
import com.mecol.dormitory.service.DormitoryService;
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
@RequestMapping("/student")
public class StudentController {


    @Autowired
    private StudentService studentService;
    @Autowired
    private ClassService classService;
    @Autowired
    private DormitoryService dormitoryService;

    @RequestMapping("/studentList")
    public String studentList(HttpSession session)
    {
        List<Class> classes=classService.getAllClasses();
        session.setAttribute("classes",classes);
        List<Dormitory> dormitories=dormitoryService.getAllDormitories();
        session.setAttribute("dormitories",dormitories);
        return "/jsp/student/studentList";
    }
    @RequestMapping("/getAllStudentList")
    @ResponseBody
    public ResultUtil getAllStudentList(Integer page, Integer limit, StudentSearch search)
    {
        //这是带分页的查询
        return studentService.getAllStudentList(page,limit,search);
    }


    @RequestMapping("/deleteStudentById")
    @ResponseBody
    public ResultUtil deleteStudentById(int id)
    {
        return studentService.deleteStudentById(id);
    }
    @RequestMapping("/editStudent/{id}")
    public String editStudent(@PathVariable("id")int id, HttpSession session)
    {
        Student student=studentService.getStudentById(id);
        session.setAttribute("student",student);
        return "/jsp/student/editStudent";
    }

    @RequestMapping("/updateStudent")
    @ResponseBody
    public ResultUtil updateStudent(Student student)throws ParseException
    {
        //System.out.println("曹操。。。。。。");
        return studentService.updateStudent(student);
    }


    @RequestMapping("/addStudent")
    public String addStudent()
    {
        return "/jsp/student/addStudent";
    }
    @RequestMapping("/checkStudentByStudentname/{username}")
    @ResponseBody
    public ResultUtil checkStudentByStudentname(@PathVariable("username")String username)
    {
        Student student=studentService.selStudentByStudentname(username);
        if(student!=null)
        {
            return new ResultUtil(500,"学生姓名已经存在，请做标记");
        }
        return new ResultUtil(0);
    }

    @RequestMapping("/insertStudent")
    @ResponseBody
    public ResultUtil insStudent(Student student)
    {
        // System.out.println("曹操。。。。。。。。。。。。。");
        try {
            studentService.insertStudent(student);
            return  ResultUtil.ok();

        }
        catch (Exception e)
        {
            e.printStackTrace();
            return new ResultUtil(500,"数据库sql等错误，请检查输出");
        }

    }

}
