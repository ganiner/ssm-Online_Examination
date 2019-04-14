package cn.ganiner.service.impl;


import cn.ganiner.dao.ExamMapper;
import cn.ganiner.pojo.Exam.*;
import cn.ganiner.service.ExamService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ExamServiceImpl implements ExamService {
    @Autowired
     private ExamMapper examMapper;


    @Override
    public void CreateExam(ExamInformation examInformation) {
        examMapper.CreateExam(examInformation);
    }

    @Override
    public List<ExamInformation> AllExam() {
        return examMapper.AllExam();
    }

    @Override
    public List<PaperChoice> RandChoice(Long choicenum, String chaptertwo, int difficulty) {
        return examMapper.RandChoice(choicenum,chaptertwo,difficulty);
    }

    @Override
    public List<PaperJudge> RandJudge(Long judgenum, String chaptertwo, int difficulty) {
        return examMapper.RandJudge(judgenum,chaptertwo,difficulty);
    }

    @Override
    public void insertRandChoice(List<PaperChoice> choices) {
        examMapper.insertRandChoice(choices);
    }

    @Override
    public void insertRandJudge(List<PaperJudge> judges) {
examMapper.insertRandJudge(judges);
    }

    @Override
    public List<PaperChoice> AllPaperChoice(int examid) {
        return examMapper.AllPaperChoice(examid);
    }

    @Override
    public List<PaperJudge> AllPaperJudge(int examid) {
        return examMapper.AllPaperJudge(examid);
    }

    @Override
    public ExamInformation findById(int id) {
        return examMapper.findById(id);
    }

    @Override
    public void CreateAllAnswer(List<AllAnswer> allAnswers) {
        examMapper.CreateAllAnswer(allAnswers);
    }


    @Override
    public void CreateExamHistory(ExamHistory examHistory) {
           examMapper.CreateExamHistory(examHistory);
    }

    @Override
    public List<AllAnswer> AllAnswer(int studentid, int examid) {
        return examMapper.AllAnswer(studentid,examid);
    }

    @Override
    public List<ExamHistory> ByStudentid(int studentid) {
        return examMapper.ByStudentid(studentid);
    }


    @Override
    public List<ExamInformation> AlreadExam(List<Long> longList) {
        return examMapper.AlreadExam(longList);
    }

    @Override
    public ExamHistory DetilsExam(int studentid, int examid) {
        return examMapper.DetilsExam(studentid,examid);
    }

    @Override
    public void DeletePaperChoice(int examid) {
     examMapper.DeletePaperChoice(examid);
    }

    @Override
    public void DeletePaperJudge(int examid) {
examMapper.DeletePaperJudge(examid);
    }

    @Override
    public void DeleteExamInfo(int examid) {
     examMapper.DeleteExamInfo(examid);
    }

    @Override
    public List<ExamHistory> ByExamId(int examid) {
        return examMapper.ByExamId(examid);
    }


}
