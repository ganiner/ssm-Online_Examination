package cn.ganiner.dao;

import cn.ganiner.pojo.Tk.Blank;

import java.util.List;

public interface BlankMapper {
    List<Blank> findBlankAll();

    Blank findBlankId(Long id);

    void  DeleteBlank(Long id);
    void  CreateBlank(Blank blank);
    void UpdateBlank(Blank blank);

}
