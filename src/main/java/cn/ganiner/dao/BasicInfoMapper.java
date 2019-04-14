package cn.ganiner.dao;

import cn.ganiner.pojo.BasicInfo.*;
import cn.ganiner.pojo.Student;

import java.util.List;

public interface BasicInfoMapper {
    List<Semester> findAll();
    List<Major> findMaAll(Long seid);
    List<Blass>findCiAll(Long maid);
    Class findCiId(Long id);
    void CreateSemester(Semester semester);
    void CreateMajor(Major major);
    void CreateBlass(Blass blass);
    void CreateStudent(Student student);

    void UpSemester(Semester semester);
    void UpMajor(Major major);
    void UpBlass(Blass blass);

    List<Student>findClass(String classname);
     Integer deleteSemester(int[] id_arr);//批量删除
   void DeleteClass(String cname);
    void DeleteMajor(Long maid);
    void DeleteYear(Long seid);

    List<Depart> AllDepart();
    void InsertDepart(Depart depart);
    void deleteDepart(int id);
   void updateDepart(Depart depart);

    List<Sit> AllSit();
    void InsertSit(Sit sit);
    void deleteSit(int id);
    void updateSit(Sit sit);
}
