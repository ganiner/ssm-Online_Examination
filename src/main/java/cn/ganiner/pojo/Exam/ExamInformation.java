package cn.ganiner.pojo.Exam;

import java.sql.Date;


public class ExamInformation {
    private String studentname;
    private int id;
    private String examname;
    private String teacher;
    private Date begindate;
    private Date enddate;
    private int examtime;
    private String password;
    private String chaptertwo;
    private int choicenum;
    private int choicescore;
    private int judgenum;
    private  int judgescore;
    private int difficulty;
    private int allscore;


    public String getExamname() {
        return examname;
    }

    public void setExamname(String examname) {
        this.examname = examname;
    }

    public String getTeacher() {
        return teacher;
    }

    public void setTeacher(String teacher) {
        this.teacher = teacher;
    }

    public Date getBegindate() {
        return begindate;
    }

    public void setBegindate(Date begindate) {
        this.begindate = begindate;
    }

    public Date getEnddate() {
        return enddate;
    }

    public void setEnddate(Date enddate) {
        this.enddate = enddate;
    }

    public int getExamtime() {
        return examtime;
    }

    public void setExamtime(int examtime) {
        this.examtime = examtime;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }



    public int getChoicenum() {
        return choicenum;
    }

    public void setChoicenum(int choicenum) {
        this.choicenum = choicenum;
    }

    public int getChoicescore() {
        return choicescore;
    }

    public void setChoicescore(int choicescore) {
        this.choicescore = choicescore;
    }

    public int getJudgenum() {
        return judgenum;
    }

    public void setJudgenum(int judgenum) {
        this.judgenum = judgenum;
    }

    public int getJudgescore() {
        return judgescore;
    }

    public void setJudgescore(int judgescore) {
        this.judgescore = judgescore;
    }

    public String getChaptertwo() {
        return chaptertwo;
    }

    public void setChaptertwo(String chaptertwo) {
        this.chaptertwo = chaptertwo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getAllscore() {
        return allscore;
    }

    public void setAllscore(int allscore) {
        this.allscore = allscore;
    }


    public String getStudentname() {
        return studentname;
    }

    public void setStudentname(String studentname) {
        this.studentname = studentname;
    }

    public int getDifficulty() {
        return difficulty;
    }

    public void setDifficulty(int difficulty) {
        this.difficulty = difficulty;
    }
}
