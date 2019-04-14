package cn.ganiner.controller;


import cn.ganiner.pojo.Exam.*;
import cn.ganiner.pojo.Student;
import cn.ganiner.pojo.Teacher;
import cn.ganiner.service.ExamService;
import cn.ganiner.service.StudentService;
import cn.ganiner.service.TeacherService;
import cn.ganiner.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.*;

@Controller
@RequestMapping("/exam/")
public class ExamController {
    @Autowired
    private TeacherService teacherService;
    @Autowired
    private ExamService examService;
    @Autowired
    private UserService userService;
    @Autowired
    private StudentService studentService;

    @RequestMapping(value = "addexam.do")
    public  String addexam(Model model){
        List<Teacher> teachers = userService.findTeacherAll();
        model.addAttribute("teacher",teachers);
        return "page/teacher/addexam";
    }
    @RequestMapping(value = "adminaddexam.do")
    public  String AdminAddExam(Model model){
        List<Teacher> teachers = userService.findTeacherAll();
        model.addAttribute("teacher",teachers);
        return "page/admin/addexam";
    }

    /**
     * 添加考试
     * @param examInformation
     * @return
     */
    @RequestMapping(value = "examadd.do")
    public  String examadd(ExamInformation examInformation){
        examService.CreateExam(examInformation);
        List<PaperJudge>paperJudges = examService.RandJudge((long) examInformation.getJudgenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
        List<PaperChoice>paperChoices = examService.RandChoice((long) examInformation.getChoicenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
         for (int i = 0;i<paperChoices.size();i++){
             paperChoices.get(i).setExamid(examInformation.getId());
         }
         examService.insertRandChoice(paperChoices);
        for (int i = 0;i<paperJudges.size();i++){
            paperJudges.get(i).setExamid(examInformation.getId());
        }
      examService.insertRandJudge(paperJudges);
        return "redirect:examall.do";
    }

    /**
     * 添加选择题
     * @param examInformation
     * @return
     */
    @RequestMapping(value = "adminexamadd.do")
    public  String Adminexamadd(ExamInformation examInformation){
        examService.CreateExam(examInformation);
        List<PaperJudge>paperJudges = examService.RandJudge((long) examInformation.getJudgenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
        List<PaperChoice>paperChoices = examService.RandChoice((long) examInformation.getChoicenum(),examInformation.getChaptertwo(),examInformation.getDifficulty());
        for (int i = 0;i<paperChoices.size();i++){
            paperChoices.get(i).setExamid(examInformation.getId());
        }
        examService.insertRandChoice(paperChoices);

        for (int i = 0;i<paperJudges.size();i++){
            paperJudges.get(i).setExamid(examInformation.getId());
        }
        examService.insertRandJudge(paperJudges);

        return "redirect:allexam.do";
    }

    /**
     * 所有的考试
     * @param model
     * @return
     */
    @RequestMapping(value = "examall.do")
    public String ExamAll(Model model){
        List<ExamInformation>examInfos = examService.AllExam();
        model.addAttribute("examInfo",examInfos);
        return "page/teacher/exam_info";
    }

    /**
     * 考试详情
     * @param examid
     * @param model
     * @return
     */
    @RequestMapping(value = "detail.do")
    public String ExamDetail(@RequestParam int examid, Model model){
        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
       ExamInformation examInformations = examService.findById(examid);
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        model.addAttribute("examinfo",examInformations);
        return "page/teacher/exam_detail";
    }

    @RequestMapping(value = "admindetail.do")
    public String AdminExamDetail(@RequestParam int examid, Model model){

        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
        ExamInformation examInformations = examService.findById(examid);
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        model.addAttribute("examinfo",examInformations);
        return "page/admin/exam_detail";
    }

    /**
     * 删除考题
     * @param examid
     * @return
     */
    @RequestMapping(value = "deleteexam.do")
    public String DeleteExam(@RequestParam int examid){
        examService.DeletePaperChoice(examid);
        examService.DeletePaperJudge(examid);
        examService.DeleteExamInfo(examid);
        return "redirect:examall.do";
    }


    @RequestMapping(value = "admindeleteexam.do")
    public String AdminDeleteExam(@RequestParam int examid){
        examService.DeletePaperChoice(examid);
        examService.DeletePaperJudge(examid);
        examService.DeleteExamInfo(examid);
        return "redirect:allexam.do";
    }

    /**
     * 管理员查询
     * @param model
     * @return
     */
    @RequestMapping(value = "allexam.do")
    public String AllExam(Model model){
        List<ExamInformation>examInfos = examService.AllExam();
        model.addAttribute("examInfo",examInfos);
        return "page/admin/exam_info";
    }

    /**
     * 根据考试id查询所有参加过考试的学生
     * @param examid
     * @param model
     * @return
     */
    @RequestMapping(value = "allexamstu.do")
    public String AllExamStu(@RequestParam int examid, Model model){

        Map<Long, Long> map = new HashMap<>();
      List<ExamHistory>examHistories = examService.ByExamId(examid);
        List<Long>longList = new ArrayList<Long>();
        List<Student>students = new ArrayList<Student>();
        for(int i = 0;i < examHistories.size();i++){
           map.put(examHistories.get(i).getStudentid(),examHistories.get(i).getScore());
            longList.add(examHistories.get(i).getStudentid());
        }
        if(longList.isEmpty()){
          students.add(null);
        }
        else {
            students = studentService.AllStudent(longList);
            for (int i = 0; i < examHistories.size(); i++) {
                students.get(i).setId(map.get(students.get(i).getId()));
            }
            Collections.sort(students, new Comparator<Student>() {
                public int compare(Student p1, Student p2) {
                    if (p1.getId() < p2.getId()) {
                        return 1;
                    }
                    if (p1.getId() == p2.getId()) {
                        return 0;
                    }
                    return -1;
                }
            });
        }
        model.addAttribute("student",students);
        return "page/admin/exam_allstudent";
    }

    /**
     * 老师页根据考试id查询所有参加过考试的学生
     * @param examid
     * @param model
     * @return
     */
    @RequestMapping(value = "allstuexam.do")
    public String AllStuExam(@RequestParam int examid, Model model){
        Map<Long, Long> map = new HashMap<>();
        List<ExamHistory>examHistories = examService.ByExamId(examid);
        List<Long>longList = new ArrayList<Long>();
        List<Student>students = new ArrayList<Student>();
        for(int i = 0;i < examHistories.size();i++){
            map.put(examHistories.get(i).getStudentid(),examHistories.get(i).getScore());
            longList.add(examHistories.get(i).getStudentid());
        }
        if(longList.isEmpty()){
            students.add(null);
        }
        else {
            students = studentService.AllStudent(longList);
            for (int i = 0; i < examHistories.size(); i++) {
                students.get(i).setId(map.get(students.get(i).getId()));
            }
            Collections.sort(students, new Comparator<Student>() {
                public int compare(Student p1, Student p2) {
                    if (p1.getId() < p2.getId()) {
                        return 1;
                    }
                    if (p1.getId() == p2.getId()) {
                        return 0;
                    }
                    return -1;
                }
            });
        }
        model.addAttribute("student",students);
        return "page/teacher/exam_allstudent";
    }

    /**
     * 考试
     * @param model
     * @param studentid
     * @return
     */
    @RequestMapping(value = "examallstu.do")
    public String ExamStuAll(Model model, @RequestParam int studentid){
        List<ExamInformation>examInfos = examService.AllExam();
        List<ExamHistory>examHistories =examService.ByStudentid(studentid);
          for(int i = 0;i < examInfos.size();i++){
              for(int j = 0;j < examHistories.size();j++){
                  if (examHistories.get(j).getExamid() == examInfos.get(i).getId()){
                         examInfos.remove(examInfos.get(i));
                  }
              }
          }
        model.addAttribute("examInfo",examInfos);
        return "page/student/exam_info";
    }


    @RequestMapping(value = "exampaper.do")
    public String ExamPaper(@RequestParam int examid, Model model){

        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
        ExamInformation examInformation = examService.findById(examid);
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        model.addAttribute("examinfo", examInformation);
        return "page/student/exam_paper";
    }

    @RequestMapping(value = "saveexam.do")
    public String SaveExam(@RequestParam int examid, @RequestParam long studentid,
                           @RequestParam String[] answerchoice, @RequestParam String[] answerjudge,
                           Model model){

       List<PaperChoice>paperChoices =  examService.AllPaperChoice(examid);
       List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
       ExamInformation examInformation = examService.findById(examid);
       List<AllAnswer>allAnswers =new ArrayList<AllAnswer>();
       ExamHistory examHistory = new ExamHistory();

       int allscore = 0;
        for(int i = 0 ;i < paperChoices.size();i++){
            if(paperChoices.get(i).getAnswer().equals(answerchoice[i])){
                allscore += examInformation.getChoicescore();
            }

                AllAnswer  allAnswer= new AllAnswer();
                allAnswer.setStudentid(studentid);
                allAnswer.setExamid(examid);
                allAnswer.setStuanswer(answerchoice[i]);
                allAnswers.add(allAnswer);

        }
        for(int i = 0;i < paperJudges.size();i++){
            if (paperJudges.get(i).getAnswer().equals(answerjudge[i]) ) {
                allscore += examInformation.getJudgescore();
            }

                AllAnswer allAnswer= new AllAnswer();
                allAnswer.setStudentid(studentid);
                allAnswer.setExamid(examid);
                allAnswer.setStuanswer(answerjudge[i]);
                allAnswers.add(allAnswer);

        }

         examService.CreateAllAnswer(allAnswers);
       examHistory.setExamid(examid);
       examHistory.setStudentid(studentid);
       examHistory.setScore(allscore);
       examService.CreateExamHistory(examHistory);
        return "redirect:examallstu.do?studentid="+studentid;
    }

    /**
     * 试卷回顾
     * @param studentid
     * @param model
     * @return
     */
    @RequestMapping(value = "examhistory.do")
    public String ExamHistory(@RequestParam int studentid, Model model){
        List<ExamHistory>examHistories =examService.ByStudentid(studentid);
        List<Long>longList = new ArrayList<Long>();
        for(int i = 0;i < examHistories.size();i++){
            longList.add(examHistories.get(i).getExamid());
        }
        List<ExamInformation> examInformations = examService.AlreadExam(longList);
       for(int i  =0;i < examInformations.size();i++){
           examInformations.get(i).setAllscore((int) examHistories.get(i).getScore());
       }
       model.addAttribute("examend",examInformations);
       return "page/student/exam_end";
    }
    @RequestMapping(value = "examdetial.do")
    public  String ExamHistory(@RequestParam int studentid, @RequestParam int examid, Model model){
        List<AllAnswer>allAnswers = examService.AllAnswer(studentid,examid);
        List<PaperChoice>paperChoices = examService.AllPaperChoice(examid);
        List<PaperJudge>paperJudges = examService.AllPaperJudge(examid);
        ExamHistory examHistory =examService.DetilsExam(studentid,examid);
        ExamInformation examInformation = examService.findById(examid);
         model.addAttribute("examinfo",examInformation);

        int allscore = (int) examHistory.getScore();
        model.addAttribute("allscore",allscore);
        for(int i = 0;i < paperChoices.size();i++){
            paperChoices.get(i).setMyanswer(allAnswers.get(i).getStuanswer());
        }
        for(int i = 0;i < paperJudges.size();i++){
            paperJudges.get(i).setMyanswer(allAnswers.get(i+paperChoices.size()).getStuanswer());
      }
        model.addAttribute("choice",paperChoices);
        model.addAttribute("judge",paperJudges);
        return "page/student/exam_historypaper";
    }

    @ResponseBody
   @RequestMapping(value = "stuscore.do")
    public List<ExamInformation> StuScore(@RequestParam String name){
        List<FindStudentScore>studentScores = new ArrayList<FindStudentScore>();
        List<ExamInformation> examInformations = new ArrayList<ExamInformation>();
        Student student = new Student();
        List<Long>longList = new ArrayList<Long>();
        if(name.length() <5){
             student = studentService.login(name);
        }
        else{
           student = studentService.ByNum(name);
        }
        long id = student.getId();
        List<ExamHistory>examHistories = examService.ByStudentid((int) id);
        if(examHistories.size() ==0){
            return examInformations;
        }
        else {
            for (int i = 0; i < examHistories.size(); i++) {
                longList.add(examHistories.get(i).getExamid());
            }
            examInformations = examService.AlreadExam(longList);
            for (int i = 0; i < examInformations.size(); i++) {
                examInformations.get(i).setAllscore((int) examHistories.get(i).getScore());
                examInformations.get(i).setStudentname(student.getUsername());
            }
            return examInformations;
        }
   }
}
