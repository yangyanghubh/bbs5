package com.ncu.web.bbs.dao;

import com.ncu.web.bbs.entity.user;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface UserDao extends JpaRepository<user, Integer> {
    @Query(value = "select * from user where username =? and password=?", nativeQuery = true)
    user getuserByNamepass(String username, String password);

    @Query(value = "select * from user where username=?", nativeQuery = true)
    user getuserByName(String name);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update  user set nickname =? ,tel = ?, position =?, integral =?, nature =?,status=?  where username = ?", nativeQuery = true)
    void update(String nickname, String tel, String position, String integral, String nature, String status, String username);

    @Query(value = "delete from user where username =?", nativeQuery = true)
    void deleteuserByName(String name);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update user set status=? where username=?", nativeQuery = true)
    void changeStatus(String status, String name);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update user set password=? where username=?", nativeQuery = true)
    void resetPassword(String password, String username);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE user ur SET ur.nickname=?2,ur.tel=?3,ur.email=?4,ur.nature=?5,ur.position=?6 where ur.id =?1")
    void editInfo(int id, String nickname, String tel, String email, String nature, String position);

    @Query(value = "select * from user where id=?", nativeQuery = true)
    user getByID(int id);
//    @Transactional
//    @Modifying(clearAutomatically = true)
//    @Query(value = "update user set password=? where id=?",nativeQuery = true)
//    void editInfo(user user);
}
