package cn.ganiner.service.impl;


import cn.ganiner.dao.TeacherMapper;
import cn.ganiner.pojo.Teacher;
import cn.ganiner.service.TeacherService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class TeacherServiceImpl implements TeacherService {
    @Autowired
    private TeacherMapper teacherMapper;
    @Override
    public Teacher login(String username) {
        return teacherMapper.login(username);
    }

    @Override
    public void deleteManyTeacher(String chk_value) {
        teacherMapper.deleteManyTeacher(chk_value);
    }

    @Override
    public void Upteacer(Teacher teacher) {
        teacherMapper.Upteacer(teacher);
    }


}
