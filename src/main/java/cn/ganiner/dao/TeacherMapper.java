package cn.ganiner.dao;

import cn.ganiner.pojo.Teacher;


public interface TeacherMapper {
    Teacher login(String username);
    void update(Teacher teacher);
    void deleteManyTeacher(String chk_value);
    void Upteacer(Teacher teacher);

}
