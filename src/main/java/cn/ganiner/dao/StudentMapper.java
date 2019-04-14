package cn.ganiner.dao;

import cn.ganiner.pojo.Student;

import java.util.List;


public interface StudentMapper {
    Student login(String username);
    void deleteStudent(String num);
     int insert(Student record);
    int insertSelective(Student record);
    Student selectByPrimaryKey(Long id);
    int updateByPrimaryKeySelective(Student record);
    int updateByPrimaryKey(Student record);
    void insertInfoBatch(List<Student> list);
    void UpStudent(Student student);
    List<Student>ByClass(String classname);
    void CreatStu(Student student);
    Student ByNum(String num);
    void Updatestu(Student student);
    List<Student>AllStudent(List<Long> longList);

}
