package cn.ganiner.controller;


import cn.ganiner.pojo.Teacher;
import cn.ganiner.service.ExamService;
import cn.ganiner.service.TeacherService;
import cn.ganiner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/teacher/")
public class TeacherController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
     private ExamService examService;
    @Autowired
    private UserService userService;

    /**
     * 教师登录
     * @param username
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "login.do")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpSession session ) {
        Teacher teacher = teacherService.login(username);
        if (teacher != null) {
            if (teacher.getPassword().equals(password)) {
                session.setAttribute("teachersession",teacher);
                return "page/teacher/home";
            } else {
                model.addAttribute("message", "你输入的密码有误");
                return "page/loginInfo";
            }
        }
        else {
            model.addAttribute("message", "用户不存在");
            return "page/loginInfo";
        }
    }

    /**
     * 更新密码
     * @param username
     * @param model
     * @return
     */
    @RequestMapping(value = "uppass.do")
    public String UpPass(@RequestParam String username, Model model){
        Teacher teacher = teacherService.login(username);
        model.addAttribute("teacher",teacher);
         return "page/teacher/uppassword";
    }

    /**
     * 更新密码后的跳转
     * @param teacher
     * @return
     */
    @RequestMapping(value = "uppassword.do")
    public String UpPassord(Teacher teacher){
        teacherService.Upteacer(teacher);
        return "page/teacher/home";
    }

    /**
     * 退出
     * @param request
     * @return
     */
    @RequestMapping(value = "logout.do")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("teachersession");
        return "index";
    }





    @RequestMapping(value = "stuinfo.do")
    public  String stuifnopage(){
        return "page/teacher/stuinformation";
    }
    @RequestMapping(value = "exam.do")
    public  String Exam(){
        return "page/teacher/examtest";
    }
    @RequestMapping(value = "findexam.do")
    public  String findexam(){
        return "redirect:allexam.do";
    }
    @RequestMapping(value = "findstuscore.do")
    public String FindStuScore(){
        return "page/teacher/student_score";
    }
}
