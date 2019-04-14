package cn.ganiner.service;


import cn.ganiner.pojo.Tk.*;

import java.util.List;

public interface TkService {
    List<ProgramFill>ProgramFillAll();
    ProgramFill ByProgramFillId(Long id);
    void  DeleteProgramFill(Long id);
    void CreateProgramFill(ProgramFill programFill);
    void updateProgramFill(ProgramFill programFill);

    List<Blank> findBlankAll();
    Blank findBlankId(Long id);
    void  DeleteBlank(Long id);
    void  CreateBlank(Blank blank);
    void UpdateBlank(Blank blank);


    List<ReadProgram>ReadProgramAll();
    ReadProgram ByReadProgramId(Long id);
    void DeleteReadProgram(Long id);
    void CreateReadProgram(ReadProgram readProgram);
    void updateReadProgram(ReadProgram readProgram);


    List<ProgramDesign>ProgramDesignAll();
    ProgramDesign ByProgramDesignId(Long id);
    void DeleteProgramDesign(Long id);
    void CreateProgramDesign(ProgramDesign programDesign);
    void updateProgramDesign(ProgramDesign programDesign);

    List<Judge> AllJudge();
    Judge findJudgeId(Long id);
    void  DeleteJudge(Long id);
    void  CreateJudge(Judge judge);
    void UpdateJudge(Judge judge);
    void deleteManyJudge(String chk_value);

}
