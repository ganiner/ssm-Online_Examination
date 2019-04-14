package cn.ganiner.service.impl;


import cn.ganiner.dao.*;
import cn.ganiner.pojo.Tk.*;
import cn.ganiner.service.TkService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TkServiceImpl implements TkService {
    @Autowired
    ProgramFillMapper programFillMapper;
     @Autowired
     BlankMapper blankMapper;
     @Autowired
     ReadProgramMapper readProgramMapper;
     @Autowired
     ProgramDesignMapper programDesignMapper;
     @Autowired
     JudgeMapper judgeMapper;
    @Override
    public List<ProgramFill> ProgramFillAll() {
        List<ProgramFill>programFills = programFillMapper.ProgramFillAll();
        for(int i = 0;i < programFills.size();i++){
            String s = StringEscapeUtils.escapeHtml4(programFills.get(i).getContent());

            programFills.get(i).setContent(s);

        }
        return programFills;
    }

    @Override
    public ProgramFill ByProgramFillId(Long id) {
        return programFillMapper.ByProgramFillId(id);
    }

    @Override
    public void DeleteProgramFill(Long id) {
        programFillMapper.DeleteProgramFill(id);
    }

    @Override
    public void CreateProgramFill(ProgramFill programFill) {
        programFillMapper.CreateProgramFill(programFill);
    }

    @Override
    public void updateProgramFill(ProgramFill programFill) {
        programFillMapper.updateProgramFill(programFill);
    }

    @Override
    public List<Blank> findBlankAll() {
        List<Blank>blanks = blankMapper.findBlankAll();
        for(int i = 0;i < blanks.size();i++){
            String s = StringEscapeUtils.escapeHtml4(blanks.get(i).getContent());
            blanks.get(i).setContent(s);

        }
        return blanks;
    }

    @Override
    public Blank findBlankId(Long id) {
        return blankMapper.findBlankId(id);
    }

    @Override
    public void DeleteBlank(Long id) {
               blankMapper.DeleteBlank(id);
    }

    @Override
    public void CreateBlank(Blank blank) {
                blankMapper.CreateBlank(blank);
    }

    @Override
    public void UpdateBlank(Blank blank) {
                blankMapper.UpdateBlank(blank);
    }

    @Override
    public List<ReadProgram> ReadProgramAll() {
        List<ReadProgram>readPrograms = readProgramMapper.ReadProgramAll();
        for(int i = 0; i< readPrograms.size();i++){
            String s = StringEscapeUtils.escapeHtml4(readPrograms.get(i).getContent());

            readPrograms.get(i).setContent(s);

        }
        return readPrograms;
    }

    @Override
    public ReadProgram ByReadProgramId(Long id) {
        return readProgramMapper.ByReadProgramId(id);
    }

    @Override
    public void DeleteReadProgram(Long id) {
        readProgramMapper.DeleteReadProgram(id);

    }

    @Override
    public void CreateReadProgram(ReadProgram readProgram) {
        readProgramMapper.CreateReadProgram(readProgram);
    }

    @Override
    public void updateReadProgram(ReadProgram readProgram) {
        readProgramMapper.updateReadProgram(readProgram);
    }


    @Override
    public List<ProgramDesign> ProgramDesignAll() {
        List<ProgramDesign>programDesigns = programDesignMapper.ProgramDesignAll();
        for(int i = 0;i<programDesigns.size();i++){
            String s=StringEscapeUtils.escapeHtml4(programDesigns.get(i).getContent());

            programDesigns.get(i).getContent();
        }
        return programDesigns;
    }

    @Override
    public ProgramDesign ByProgramDesignId(Long id) {
        return programDesignMapper.ByProgramDesignId(id);
    }

    @Override
    public void DeleteProgramDesign(Long id) {
        programDesignMapper.DeleteProgramDesign(id);
    }

    @Override
    public void CreateProgramDesign(ProgramDesign programDesign) {
        programDesignMapper.CreateProgramDesign(programDesign);

    }

    @Override
    public void updateProgramDesign(ProgramDesign programDesign) {
        programDesignMapper.updateProgramDesign(programDesign);
    }

    @Override
    public List<Judge> AllJudge() {

        return judgeMapper.AllJudge();
    }

    @Override
    public Judge findJudgeId(Long id) {
        return judgeMapper.findJudgeId(id);
    }

    @Override
    public void DeleteJudge(Long id) {
          judgeMapper.DeleteJudge(id);
    }

    @Override
    public void CreateJudge(Judge judge) {
          judgeMapper.CreateJudge(judge);
    }

    @Override
    public void UpdateJudge(Judge judge) {
           judgeMapper.UpdateJudge(judge);
    }

    @Override
    public void deleteManyJudge(String chk_value) {
        judgeMapper.deleteManyJudge(chk_value);
    }
}
