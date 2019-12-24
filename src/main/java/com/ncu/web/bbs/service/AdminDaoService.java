package com.ncu.web.bbs.service;

import com.ncu.web.bbs.dao.AdminDao;
import com.ncu.web.bbs.entity.admin;
import com.ncu.web.bbs.entity.article;
import com.ncu.web.bbs.entity.user;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class AdminDaoService {
    @Autowired
    private AdminDao adminDao;
    public List<admin>  findAll(){
       return adminDao.findAll();
    }
    public admin getAdminByName(String name){
        return adminDao.queryadminByName(name);
    }


    public void saveAdmin(String name, String password, String limitation,
                         String sculpture,String tel, String email){
        admin admin1 =new admin();
        admin1.setUsername(name);
        admin1.setPassword(password);
        admin1.setLimitation(limitation);
        admin1.setSculpture(sculpture);
        admin1.setTel(tel);
        admin1.setEmail(email);
        adminDao.save(admin1);
    }


 public boolean isRight(String name,String password){
      return   adminDao.getadminByName(name,password)!=null;
 }
 public void setPassword(String password,String name){
        adminDao.setPassword(password,name);
 }


 public void updateAdmin(String tel,String email,String name){
        adminDao.updateAdmin(tel,email,name);
 }

 public void addAdmin(String name,String password,String tel,String email){
        adminDao.addAdmin(name,password,tel,email);
 }
 public void deleteAdmin(String name){
        adminDao.deleteAdmin(name);
 }
 public List<admin> findSome(String name){
      return   adminDao.findSome(name);
 }
}
