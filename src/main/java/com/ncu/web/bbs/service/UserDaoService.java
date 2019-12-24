package com.ncu.web.bbs.service;

import com.ncu.web.bbs.dao.UserDao;
import com.ncu.web.bbs.entity.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class UserDaoService {

    @Autowired
    private UserDao userDao;

    public user getUserInfoByID(int id){

        return userDao.getOne(id);
    }
    public user getByID(int id){

        return userDao.getByID(id);
    }
    public user getUserByName(String name){
        return userDao.getuserByName(name);
    }
    public List<user> getUserListByName(String name){
        List<user> users =new ArrayList<>();
        users.add(userDao.getuserByName(name));
        return users;
    }

    public boolean isRight(String name,String password){
        return userDao.getuserByNamepass(name,password)!=null;
    }

    public void saveUser(user user1){
        userDao.save(user1);

    }
    public List<user> findAll(){
        return userDao.findAll();
    }
    public void deleteUser(String name){
        userDao.deleteuserByName(name);
    }

    public void updateUser(String nickname,String tel, String position ,String integral ,String nature ,String status,String username){
        userDao.update(nickname,tel,position,integral,nature,status,username);
    }
    public void changeStatus(String name,String status){

        if(status.equals("活跃"))
            userDao.changeStatus("封号",name);
        else
            userDao.changeStatus("活跃",name);
    }
    public void resetPassword(String password,String username){
        userDao.resetPassword(password,username);
    }

    public void editInfo(user user) {
        userDao.editInfo(user.getId(),user.getNickname(),user.getTel(),user.getEmail(),user.getNature(),user.getPosition());
    }
}
