package cn.ganiner.controller;


import cn.ganiner.pojo.Student;
import cn.ganiner.service.ExamService;
import cn.ganiner.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/student/")
public class StudentController {
    @Autowired
    private StudentService studentService;
   @Autowired
    private ExamService examService;

    /**
     * 学生登录
     * @param username
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "login.do")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        Student student = studentService.login(username);
        if(student != null)
        {
            if(student.getPassword().equals(password))
            {
                session.setAttribute("studentsession",student);
                return "page/student/home";
            }
            else {
                model.addAttribute("message", "你输入的密码有误");
                return "page/loginInfo";
            }
        }
        else {
            model.addAttribute("message", "你输入的密码有误");
            return "page/loginInfo";
        }
    }

    /**
     * 学生更新密码
     * @param username
     * @param model
     * @return
     */
    @RequestMapping(value = "studentup.do")
    public String UpStudent(@RequestParam String username, Model model){
        Student student = studentService.login(username);
        model.addAttribute("student",student);
      return "page/student/uppassword";
    }

    /**
     * 更新密码
     * @param student
     * @return
     */
    @RequestMapping(value = "upstudent.do")
    public String UpStudent(Student student){
        studentService.Updatestu(student);
        return "page/student/home";
    }

    /**
     * 查找班级
     * @param classname
     * @return
     */
    @ResponseBody
   @RequestMapping(value = "byclassname.do")
   public List<Student> ByClass(@RequestParam String classname){
       List<Student>students = studentService.ByClass(classname);
       return students;
   }

    /**
     * 删除学生
     * @param num
     * @return
     */
    @RequestMapping(value = "detelestu.do")
    @ResponseBody
    public String DeleteStu( String num){
        studentService.deleteStudent(num);
        return num;
    }

    /**
     * 更新学生
     * @param student
     * @return
     */
    @RequestMapping(value = "upstu.do")
    @ResponseBody
    public Student UpStu(Student student){
        studentService.UpStudent(student);
        return student;
    }

    /**
     * 添加学生
     * @param student
     * @return
     */
    @RequestMapping(value = "creatstu.do")
    public String CreatStu(Student student){
        student.setPassword(student.getNum());
        studentService.CreatStu(student);
        return "redirect:byclassname.do?classname="+student.getClassname();
    }


    @RequestMapping(value = "savescore.do")
    public  String SaveScore(@RequestParam int allscore, @RequestParam String examname, Model model){

         model.addAttribute("score",allscore);
          return "page/student/score";
    }

    /**
     * 退出
     * @param request
     * @return
     */
    @RequestMapping(value = "logout.do")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("student");
        return "index";
    }

    /**
     * 通过id查询学生
     * @param id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "byId.do")
    public  Student FindId(@RequestParam Long id){
        Student student = studentService.selectByPrimaryKey(id);
        return student;
    }

    @ResponseBody
    @RequestMapping(value="ajaxUpload",method={RequestMethod.GET,RequestMethod.POST})
    public String ajaxUploadExcel(HttpServletRequest request,HttpServletResponse response) throws Exception {
         return studentService.ajaxUploadExcel(request, response);
    }
}

