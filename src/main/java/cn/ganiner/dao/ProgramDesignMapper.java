package cn.ganiner.dao;

import cn.ganiner.pojo.Tk.ProgramDesign;

import java.util.List;

public interface ProgramDesignMapper {
    List<ProgramDesign>ProgramDesignAll();
    ProgramDesign ByProgramDesignId(Long id);
    void DeleteProgramDesign(Long id);
    void CreateProgramDesign(ProgramDesign programDesign);
    void updateProgramDesign(ProgramDesign programDesign);
}
