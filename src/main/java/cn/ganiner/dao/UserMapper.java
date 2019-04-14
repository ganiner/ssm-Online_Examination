package cn.ganiner.dao;

import cn.ganiner.pojo.*;
import cn.ganiner.pojo.Tk.Choice;
import cn.ganiner.pojo.Tk.ReadProgram;

import java.util.List;


public interface UserMapper {
   void CreateAdmin(User user);
    void updateuser(User user);
    User login(String username);
    void create(Teacher teacher);
    void delete(Long id);
    void update(Teacher teacher);
    Teacher findById(Long id);
    List<Teacher> findTeacherAll();
    List<Point1> findPoint1All();
    void createpoint1(Point1 point1);
    void createpoint2(Point2 point2);
    void deletep1(Long id);
    void deletepp1(Long id);
    void deletep2(String chaptertwo);
    List<Point1>Point1All();
    void createchoice(Choice choice);
     Choice findBychId(Long id);
    List<Choice> findChoiceAll();
     void updatech(Choice choice);
    void deletech(Long id);
    List<ReadProgram> findreadprogramAll();
 User findUsername(String username);

    void deleteManyChoice(String chk_value);
}
