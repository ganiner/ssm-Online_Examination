package cn.ganiner.service.impl;


import cn.ganiner.dao.UserMapper;
import cn.ganiner.pojo.Point1;
import cn.ganiner.pojo.Point2;
import cn.ganiner.pojo.Teacher;
import cn.ganiner.pojo.Tk.Choice;
import cn.ganiner.pojo.Tk.ReadProgram;
import cn.ganiner.pojo.User;
import cn.ganiner.service.UserService;
import org.apache.commons.lang3.StringEscapeUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class UserServiceImpl implements UserService {


    @Autowired
    private UserMapper userMapper;

    @Override
    public void updateuser(User user) {
        userMapper.updateuser(user);
    }

    @Override
    public void CreateAdmin(User user) {
        userMapper.CreateAdmin(user);
    }

    /**
     * 用户登录的方法
     */
    public User login(String username) {
        return userMapper.login(username);
    }
    //查找所有的老师
    @Override
    public List<Teacher> findTeacherAll() {
        return userMapper.findTeacherAll();
    }
    //新建老师
    @Override
    public void create(Teacher teacher) {
            userMapper.create(teacher);
    }
    //知识点一级目录
    @Override
    public List<Point1> findPoint1All() {
        return userMapper.findPoint1All();
    }
    @Override
    public void createpoint1(Point1 point1) {
        userMapper.createpoint1(point1);
    }
    @Override
    public void createpoint2(Point2 point2) {
         userMapper.createpoint2(point2);
    }

    @Override
    public void deletep1(Long id) {
        userMapper.deletep1(id);
    }

    @Override
    public void deletepp1(Long id) {
        userMapper.deletepp1(id);
    }

    @Override
    public void deletep2(String chaptertwo) {
        userMapper.deletep2(chaptertwo);
    }


    @Override
    public List<Point1> Point1All() {
        return userMapper.Point1All();
    }
    @Override
    public List<Choice> findChoiceAll() {
        List<Choice>choices = userMapper.findChoiceAll();
        //转义字符的实现方法
        for(int i = 0;i < choices.size();i++){
            String s = StringEscapeUtils.escapeHtml4(choices.get(i).getContent());

            choices.get(i).setContent(s);

        }
        return choices;
    }
    @Override
    public void createchoice(Choice choice) {
        userMapper.createchoice(choice);
    }

    @Override
    public Choice findBychId(Long id) {
        return userMapper.findBychId(id);
    }



    public List<User> findAll() {
        return null;
    }

    @Override
    public void create(User user) {

    }

    @Override
    public Teacher findById(Long id) {
        return userMapper.findById(id);
    }

    @Override
    public void updatech(Choice choice) {
        userMapper.updatech(choice);
    }

    @Override
    public void deletech(Long id) {
        userMapper.deletech(id);
    }

    @Override
    public List<ReadProgram> findReadprogramAll() {
        List<ReadProgram>readPrograms  = userMapper.findreadprogramAll();
        for(int i = 0;i < readPrograms.size();i++){
            String s = StringEscapeUtils.escapeHtml4(readPrograms.get(i).getContent());
            readPrograms.get(i).setContent(s);

        }
        return readPrograms;
    }
    @Override
    public  User findByUsername(String username) {return userMapper.findUsername(username);}

    @Override
    public void deleteManyChoice(String chk_value) {
        userMapper.deleteManyChoice(chk_value);
    }



    public void delete(Long id) {
        userMapper.delete(id);
    }
    @Override
    public void update(User user) {
    }
    public void update(Teacher teacher) {
        userMapper.update(teacher);
    }
}
