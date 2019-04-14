package cn.ganiner.controller;

import cn.ganiner.pojo.User;
import cn.ganiner.service.TeacherService;
import cn.ganiner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/admin/")
public class AdminController {
    @Autowired
    UserService userService;
    @Autowired
    TeacherService teacherService;

    /**
     * 添加管理员
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "createadmin.do")
    public String create(User user, Model model){
        try{
            userService.CreateAdmin(user);
            model.addAttribute("message","创建管理员成功");
        }catch (Exception e){
            e.printStackTrace();
        }
        return "page/login";
    }


    @RequestMapping(value = "login.do")
    public  String stuifnopage(){
        return "page/login";
    }

    @RequestMapping(value = "register.do")
    public  String AdminRegister(){
        return "page/register";
    }

    @RequestMapping(value = "findstuscore.do")
    public String FindStuScore(){
        return "page/admin/student_score";
    }



}
