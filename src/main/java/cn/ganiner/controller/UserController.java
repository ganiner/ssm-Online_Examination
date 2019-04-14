package cn.ganiner.controller;

import cn.ganiner.pojo.Point1;
import cn.ganiner.pojo.Point2;
import cn.ganiner.pojo.Teacher;
import cn.ganiner.pojo.Tk.Choice;
import cn.ganiner.pojo.Tk.ReadProgram;
import cn.ganiner.pojo.User;
import cn.ganiner.service.BasicInfoService;
import cn.ganiner.service.TeacherService;
import cn.ganiner.service.UserService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;


@Controller
@RequestMapping("/user/")
public class UserController {
    @Autowired
    UserService userService;
    @Autowired
    TeacherService teacherService;
    @Autowired
    BasicInfoService basicInfoService;

    /**
     * 用户登录
     * @param username
     * @param password
     * @param model
     * @param session
     * @return
     */
    @RequestMapping(value = "login.do")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpSession session) {
        User user = userService.login(username);
        if (user != null) {
            if (user.getPassword().equals(password)) {

                session.setAttribute("usersession",user);
                return "page/admin/home";
            } else {
                model.addAttribute("message", "密码错误");
                return "page/loginInfo";
            }
        } else {
            model.addAttribute("message", "不存在此用户");
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
        User user = userService.login(username);
        model.addAttribute("user",user);
        return "page/admin/uppassword";
    }

    /**
     * 新密码更新
     * @param user
     * @param model
     * @return
     */
    @RequestMapping(value = "newpass.do")
    public String NewPass(User user,Model model){
        userService.updateuser(user);
        model.addAttribute("message", "密码更新成功");
        return "page/admin/home";
    }

    /**
     * 显示所有教师
     * @param model
     * @return
     */
    @RequestMapping(value = "findallteacher.do")
    public String findTeacherAll(Model model){
        List<Teacher> teachers  = userService.findTeacherAll();
        model.addAttribute("teachers",teachers);
        return  "page/admin/teacher";
    }

    /**
     * 批量删除教师
     * @param chk_value
     * @return
     */
    @RequestMapping(value = "deletemanyteacher.do")
    public String ManyTeacher(String chk_value){
        teacherService.deleteManyTeacher(chk_value);
        return "redirect:findallteacher.do";
    }

    /**
     * 查询教师
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "listteacher.do")
    public List<Teacher> Listteacher(){
        List<Teacher>teachers = userService.findTeacherAll();
        return teachers;
    }


    /**
     * 保存教师
     * @param teacher
     * @param model
     * @return
     */
    @RequestMapping(value = "save.do")
    public String create(Teacher teacher, Model model) {
        try {
            userService.create(teacher);
            model.addAttribute("message", "保存客户信息系成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findallteacher.do";
    }

    /**
     * 单独删除教师
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "delete.do")
    public String delete(@RequestParam Long id, Model model) {
        try {
            userService.delete(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findallteacher.do";
    }

    /**
     * 根据id查询教师
     * @param teacher
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findById.do")
    public Teacher findById(@RequestBody Teacher teacher) {
        Teacher teacher_info = userService.findById(teacher.getId());
        if (teacher_info != null) {
            return teacher_info;
        } else {
            return null;
        }
    }

    /**
     * 更新教师信息
     * @param teacher
     * @param model
     * @return
     */
    @RequestMapping(value = "update.do")
    public String update(Teacher teacher, Model model) {
        try {
            userService.update(teacher);
            model.addAttribute("message", "更新老师信息成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findallteacher.do";
    }

    /**
     * 查找知识点，根据知识点一级目录
     * @param model
     * @return
     */
    @RequestMapping(value = "findpoint1.do")
    public String findPoint1All(Model model){
        List<Point1>point1  = userService.findPoint1All();
        model.addAttribute("point1",point1);
        return "page/admin/point";
    }

    /**
     * 保存一级目录知识点
     * @param point1
     * @param model
     * @return
     */
    @RequestMapping(value = "addpoint1.do")
    public String createpoint1(Point1 point1, Model model) {
        try {
            userService.createpoint1(point1);
            model.addAttribute("message", "保存章节成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findpoint1.do";
    }

    /**
     * 删除一级目录知识点
     * @param id
     * @return
     */
    @RequestMapping(value = "delep1.do")
    public  String DeleteP1(@RequestParam int id){
        userService.deletep1((long) id);
        userService.deletepp1((long) id);
        return "redirect:findpoint1.do";
    }

    /**
     * 删除二级目录
     * @param chaptertwo
     * @return
     */
    @RequestMapping(value = "delep2.do")
    public  String DeleteP2(@RequestParam String chaptertwo){
        userService.deletep2(chaptertwo);
        return "redirect:findpoint1.do";
    }

    /**
     * 增加二级目录
     * @param point2
     * @param model
     * @return
     */
    @RequestMapping(value = "addpoint2.do")
    public String createpoint2(Point2 point2, Model model) {
        try {
            userService.createpoint2(point2);
            model.addAttribute("message", "保存章节成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findpoint1.do";
    }

    /**
     * 添加选择题
     * @param choice
     * @param model
     * @return
     */
    @RequestMapping(value = "addchoice.do")
    public String createchoice(Choice choice, Model model){
        try{
            userService.createchoice(choice);
            model.addAttribute("message", "保存章节成功");
        }catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findallchoice.do";
    }

    /**
     * 显示一级目录
     * @param model
     * @return
     */
    @RequestMapping(value = "allpoint1.do")
    @ResponseBody
    public List<Point1> point1All(Model model){
        List<Point1>pt1  = userService.Point1All();

        return pt1;
    }

    /**
     * 查找所有知识点
     * @param model
     * @return
     */
    @RequestMapping(value = "pointall.do")
    @ResponseBody
    public List<Point1> pointAll(Model model){
        List<Point1>point  = userService.findPoint1All();
        model.addAttribute("point",point);
        return point;
    }

    /**
     * 显示所有知识点
     * @param model
     * @param pn
     * @return
     */
    @RequestMapping(value = "findallchoice.do")
    public String findChoiceAll(Model model,@RequestParam(defaultValue = "1") int pn){
        PageHelper.startPage(pn,6);
        List<Choice>choice = userService.findChoiceAll();
        PageInfo pageInfo = new PageInfo(choice,5);
        model.addAttribute("pageInfo",pageInfo);
        return  "page/admin/tk_choice";
    }

    /**
     * 根据id查询选择题
     * @param choice
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findBychId.do")
    public Choice findBychId(@RequestBody Choice choice) {
        Choice choice_info = userService.findBychId(choice.getId());
        if (choice_info != null) {
            return choice_info;
        } else {
            return null;
        }
    }

    /**
     * 更新选择题
     * @param choice
     * @param model
     * @return
     */
    @RequestMapping(value = "updatech.do")
    public String updatech(Choice choice, Model model) {
        try {
            userService.updatech(choice);
            model.addAttribute("message", "更新选择题信息成功");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findallchoice.do";
    }

    /**
     * 根据id删除选择题
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "deletech.do")
    public String deletech(@RequestParam Long id, Model model) {
        try {
            userService.deletech(id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "redirect:findallchoice.do";
    }

    /**
     * 查看所有选择题
     * @param model
     * @return
     */
    @RequestMapping(value = "readall.do")
    @ResponseBody
    public List<ReadProgram> pointReadProgramPAll(Model model){
        List<ReadProgram>readPrograms  = userService.findReadprogramAll();
        model.addAttribute("readPrograms",readPrograms);
        return  readPrograms;
    }

    @RequestMapping(value="validate.do",method = RequestMethod.POST)
    @ResponseBody
    public  boolean validate(@RequestParam String username) {
        User user=userService.findByUsername(username);
        if(null!=user) {
            return true;
        }
        else {
            return false;
        }
    }


    /**
     * 批量删除选择题
     * @param chk_value
     * @return
     */
    @RequestMapping(value = "deletechoiceall")
    public String ManyChoice(String chk_value){
        userService.deleteManyChoice(chk_value);
        return "redirect:findallchoice.do";
    }


    /**
     * 退出
     * @param request
     * @return
     */
    @RequestMapping(value = "logout.do")
    public String logout(HttpServletRequest request){
        HttpSession session = request.getSession();
        session.removeAttribute("usersession");
        return "index";
    }
    /**
     * 返回教师页面
     * @param model
     * @return
     */
    @RequestMapping(value = "ListTeacher.do")
    public String toListPage(Model model) {
        return "redirect:findallteacher.do";
    }

    /**
     * 返回登录页
     * @return
     */
    @RequestMapping(value="index")
    public String index(){
        return    "index";
    }

    /**
     * 跳转到教师
     * @return
     */
    @RequestMapping(value = "toteacher.do")
    public String toSavePage() {
        return "page/admin/adteacher";
    }

    /**
     * 跳转到题库
     * @return
     */
    @RequestMapping(value = "ListTk.do")
    public String Tk() {
        return "page/admin/adtk";
    }

    /**
     * 跳转到选择
     * @return
     */
    @RequestMapping(value = "toallchoice.do")
    public String toAllChoice() {
        return "redirect:findallchoice.do";
    }
    @RequestMapping(value = "toallread.do")
    public  String toAllRead(){
        return "page/admin/adreadProgram";
    }
    @RequestMapping(value = "stuinfo.do")
    public  String stuifnopage(){
        return "page/teacher/studentinfo";
    }

}
