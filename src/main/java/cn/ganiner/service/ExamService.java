package cn.ganiner.service;

import cn.ganiner.pojo.Exam.*;

import java.util.List;

public interface ExamService {



    void CreateExam(ExamInformation examInformation);
    List<ExamInformation> AllExam();
    List<PaperChoice> RandChoice(Long choicenum, String chaptertwo, int difficulty);
    List<PaperJudge> RandJudge(Long judgenum, String chaptertwo, int difficulty);
    void insertRandChoice(List<PaperChoice> paperChoices);
    void insertRandJudge(List<PaperJudge> paperJudges);
    List<PaperChoice>AllPaperChoice(int examid);
    List<PaperJudge>AllPaperJudge(int examid);
    ExamInformation findById(int id);
    void CreateAllAnswer(List<AllAnswer> allAnswers);
    void CreateExamHistory(ExamHistory examHistory);
    List<AllAnswer>AllAnswer(int studentid, int examid);
    List<ExamHistory> ByStudentid(int studentid);
    List<ExamInformation> AlreadExam(List<Long> longList);
    ExamHistory DetilsExam(int studentid, int examid);
    void DeletePaperChoice(int examid);
    void DeletePaperJudge(int examid);
    void DeleteExamInfo(int examid);
    List<ExamHistory>ByExamId(int examid);

//    List<WrongAnswer>WrongChoice(int studentid);
//    List<WrongAnswer>WrongJudge(int studentid);

}
