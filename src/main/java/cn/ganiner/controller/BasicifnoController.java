package cn.ganiner.controller;


import cn.ganiner.pojo.BasicInfo.*;
import cn.ganiner.pojo.Student;
import cn.ganiner.service.BasicInfoService;
import cn.ganiner.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/basic/")
public class BasicifnoController {
    @Autowired
    private BasicInfoService basicInfoService;
    @Autowired
    private StudentService studentService;

    /**
     * 所有学期
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findall.do")
    public List<Semester> findAll(){
        List<Semester>semesters=basicInfoService.findAll();
        return  semesters;
    }

    /**
     * 所有学期
     * @param model
     * @return
     */
    @RequestMapping(value = "allsemester.do")
    public String AllSemester(Model model){
        List<Semester>semesters = basicInfoService.findAll();
        model.addAttribute("semester",semesters);
        return "page/admin/base_year";
    }


    /**
     * 添加学期
     * @param semester
     * @return
     */
    @RequestMapping(value = "insertse.do")
    public String CreatSe(Semester semester){
        basicInfoService.CreateSemester(semester);
        return "redirect:allsemester.do";
    }

    /**
     * 批量删除学期
     * @param chk_value
     * @return
     */
    @RequestMapping(value = "deletesemester.do")
    public String deletesemester(int[] chk_value){
         if (chk_value == null){
             return "redirect:allsemester.do";
         }
         else{
             basicInfoService.deleteSemester(chk_value);
             return "redirect:allsemester.do";
         }
    }

    /**
     * 查找专业
     * @param seid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findmaall.do")
    public List<Major> findMaall(@RequestParam Long seid){
        List<Major>majors= basicInfoService.findMaAll(seid);
        return majors;
    }

    /**
     * 所有专业
     * @param seid
     * @param model
     * @return
     */
    @RequestMapping(value = "allmajor.do")
    public  String AllMajor(@RequestParam long seid, Model model){
        List<Major>majors = basicInfoService.findMaAll(seid);
        model.addAttribute("major",majors);
        model.addAttribute("seid",seid);
        return "page/admin/base_major";
    }

    /**
     * 新增专业
     * @param major
     * @param model
     * @return
     */
    @RequestMapping(value = "insertma.do")
    public  String InsertMa(Major major, Model model){
           basicInfoService.CreateMajor(major);
           model.addAttribute("seid",major.getSeid());
          return "redirect:allmajor.do";
    }

    /**
     * 查找班级
     * @param maid
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "findciall.do")
    public List<Blass> findCiall(@RequestParam Long maid){
        List<Blass>classes = basicInfoService.findCiAll(maid);
        return classes;
    }


    /**
     * 所有班级
     * @param maid
     * @param model
     * @return
     */
    @RequestMapping(value = "allclass.do")
    public String AllClass(@RequestParam long maid, Model model){
        List<Blass>classes = basicInfoService.findCiAll(maid);
        model.addAttribute("cla",classes);
        model.addAttribute("maid",maid);
        return  "page/admin/base_class";
    }

    /**
     * 新增班级
     * @param blass
     * @param model
     * @return
     */
    @RequestMapping(value = "insertclass.do")
    public String Isertcl(Blass blass,Model model){
        basicInfoService.CreateBlass(blass);
        model.addAttribute("maid",blass.getMaid());
        return  "redirect:allclass.do";
    }

    /**
     * 查找某班级下的学生
     * @param cname
     * @param model
     * @return
     */
    @RequestMapping(value = "allstudent.do")
    public  String FindStudent(@RequestParam String cname, Model model){
        List<Student>students = basicInfoService.findClass(cname);
        model.addAttribute("student",students);
        model.addAttribute("cname",cname);
        return "page/admin/base_student";
    }


    /**
     * 查找班级下的所有学生
     * @param cname
     * @return
     */
    @RequestMapping(value = "studentall.do")
    @ResponseBody
    public List<Student> FindStudentAll(@RequestParam String cname){
        List<Student>students = basicInfoService.findClass(cname);
        return students;
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
        return "redirect:allstudent.do?cname="+student.getClassname();
    }


    /**
     * 删除班级
     * @param cname
     */
    @RequestMapping(value = "deleteclass.do")
    public void DeleteClass(@RequestParam String cname){
             basicInfoService.DeleteClass(cname);

    }

    /**
     * 删除专业
     * @param maid
     */
    @RequestMapping(value = "deletemajor.do")
    public void DeleteMajor(@RequestParam Long maid){
        basicInfoService.DeleteMajor(maid);

    }

    /**
     * 删除学年
     * @param seid
     */
    @RequestMapping(value = "deleteyear.do")
    public void DeleteYear(@RequestParam Long seid){

        basicInfoService.DeleteYear(seid);

    }



    @RequestMapping(value = "upse.do")
    public String UpSe(Semester semester){

        basicInfoService.UpSemester(semester);
        return "redirect:allsemester.do";
    }
    @RequestMapping(value = "upma.do")
    public String UpMa(Major major,Model model){

        basicInfoService.UpMajor(major);
        model.addAttribute("seid",major.getSeid());
        return "redirect:allmajor.do";
    }
    @RequestMapping(value = "upcl.do")
    public String UpMa(Blass blass,Model model){
        basicInfoService.UpBlass(blass);
        model.addAttribute("maid",blass.getMaid());
        return "redirect:allclass.do";
    }







    @RequestMapping(value = "alldepart.do")
    public  String AllDepart(Model model){
        List<Depart>departs = basicInfoService.AllDepart();
        model.addAttribute("depart",departs);
        return "page/admin/base_depart";
    }
    @ResponseBody
    @RequestMapping(value = "depart.do")
    public List<Depart> Depart(){
        List<Depart>departs = basicInfoService.AllDepart();
        return departs;
    }
    @RequestMapping(value = "adddepart.do")
    public String AddDepart(Depart depart){
        basicInfoService.InsertDepart(depart);
        return "redirect:alldepart.do";
    }
    @RequestMapping(value = "deletedepart.do")
    public String DeleteDepart(@RequestParam int id){
        basicInfoService.deleteDepart(id);
        return "redirect:alldepart.do";
    }
    @RequestMapping(value = "updepart.do")
    public String UpDepart(Depart depart){
        basicInfoService.updateDepart(depart);
        return "redirect:alldepart.do";
    }


    @RequestMapping(value = "allsit.do")
    public  String AllSit(Model model){
        List<Sit>sits = basicInfoService.AllSit();
        model.addAttribute("sit",sits);
        return "page/admin/base_sit";
    }
    @ResponseBody
    @RequestMapping(value = "sit.do")
    public List<Sit> Sit(){
        List<Sit>sits = basicInfoService.AllSit();
        return sits;
    }
    @RequestMapping(value = "addsit.do")
    public String AddSit(Sit sit){
        basicInfoService.InsertSit(sit);
        return "redirect:allsit.do";
    }
    @RequestMapping(value = "deletesit.do")
    public String DeleteSit(@RequestParam int id){
        basicInfoService.deleteSit(id);
        return "redirect:allsit.do";
    }
    @RequestMapping(value = "upsit.do")
    public String UpSit(Sit sit){
        basicInfoService.updateSit(sit);
        return "redirect:allsit.do";
    }
}

