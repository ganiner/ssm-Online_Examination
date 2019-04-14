package cn.ganiner.service;



import cn.ganiner.pojo.Student;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public interface StudentService {
   Student login(String username);
   String ajaxUploadExcel(HttpServletRequest request, HttpServletResponse response);
   List<Student> ByClass(String classname);
   void deleteStudent(String num);
   void UpStudent(Student student);

   Student selectByPrimaryKey(Long id);
   void CreatStu(Student student);
   Student ByNum(String num);
   void Updatestu(Student student);
   List<Student>AllStudent(List<Long> longList);
}
