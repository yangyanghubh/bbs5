package com.ncu.web.bbs.dao;

import com.ncu.web.bbs.entity.admin;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface AdminDao extends JpaRepository<admin, Integer> {
    @Query(value = "select * from admin where username =?", nativeQuery = true)
    admin queryadminByName(String name);

    @Query(value = "select * from admin where username =? and password=?",nativeQuery = true)
    admin  getadminByName(String username,String password);


    @Query(value = "update  admin set password = ? where username =?",nativeQuery = true)
    void setPassword(String password, String name);


    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update admin set tel=?,email=? where username=?",nativeQuery = true)
    void updateAdmin(String tel,String email,String name);


    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = " insert into admin(username,password,tel,email,limitation,sculpture) values(?,?,?,?,1,'头像')",nativeQuery = true)
    void addAdmin(String name,String password,String tel,String email);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = " delete from admin where username=?",nativeQuery = true)
    void deleteAdmin(String name);

    @Query(value = "select * from admin where username =?",nativeQuery = true)
    ArrayList<admin> findSome(String name);
}
