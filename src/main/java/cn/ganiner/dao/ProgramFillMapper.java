package cn.ganiner.dao;

import cn.ganiner.pojo.Tk.ProgramFill;

import java.util.List;

public interface ProgramFillMapper {
    List<ProgramFill>ProgramFillAll();
    ProgramFill ByProgramFillId(Long id);
    void  DeleteProgramFill(Long id);
    void CreateProgramFill(ProgramFill programFill);
    void updateProgramFill(ProgramFill programFill);
}
