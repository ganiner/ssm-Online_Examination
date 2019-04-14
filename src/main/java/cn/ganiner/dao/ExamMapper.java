package cn.ganiner.dao;

import cn.ganiner.pojo.Exam.*;
import org.apache.ibatis.annotations.Param;

import java.util.List;


public interface ExamMapper {



    void CreateExam(ExamInformation examInformation);
    List<ExamInformation> AllExam();

    List<PaperChoice> RandChoice(@Param("choicenum") Long choicenum, @Param("chaptertwo") String chaptertwo, @Param("difficulty") int difficulty);
    List<PaperJudge> RandJudge(@Param("judgenum") Long judgenum, @Param("chaptertwo") String chaptertwo, @Param("difficulty") int difficulty);

   void insertRandChoice(List<PaperChoice> paperChoices);
    void insertRandJudge(List<PaperJudge> paperJudges);
    List<PaperChoice>AllPaperChoice(int examid);
    List<PaperJudge>AllPaperJudge(int examid);
    ExamInformation findById(int id);
    void CreateAllAnswer(List<AllAnswer> allAnswers);
    void CreateExamHistory(ExamHistory examHistory);
    List<ExamHistory> ByStudentid(int studentid);
    ExamHistory DetilsExam(@Param("studentid") int studentid, @Param("examid") int examid);
    List<ExamInformation> AlreadExam(List<Long> longList);
    List<AllAnswer>AllAnswer(@Param("studentid") int studentid, @Param("examid") int examid);
    void DeletePaperChoice(int examid);
    void DeletePaperJudge(int examid);
    void DeleteExamInfo(int examid);
    List<ExamHistory>ByExamId(int examid);

}
