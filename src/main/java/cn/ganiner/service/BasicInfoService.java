package cn.ganiner.service;



import cn.ganiner.pojo.BasicInfo.*;
import cn.ganiner.pojo.Student;

import java.util.List;

public interface BasicInfoService {
    List<Semester> findAll();
    List<Major> findMaAll(Long seid);
    List<Blass>findCiAll(Long maid);
    void CreateSemester(Semester semester);
    Integer deleteSemester(int[] id_arr);//批量删除
    void CreateMajor(Major major);
    void CreateBlass(Blass blass);
    void UpSemester(Semester semester);
    void UpMajor(Major major);
    void UpBlass(Blass blass);
    void CreateStudent(Student student);
    List<Student>findClass(String classname);

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
