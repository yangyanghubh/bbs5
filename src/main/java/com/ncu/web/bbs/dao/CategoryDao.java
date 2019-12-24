package com.ncu.web.bbs.dao;

import com.ncu.web.bbs.entity.category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
public interface CategoryDao extends JpaRepository<category,Integer> {

    @Query(value = "select * from category where name=?",nativeQuery = true)
    category getCategoryByName(String name);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update category set description=? where name=?",nativeQuery = true)
    void updateCategory(String desc,String name);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = " insert into category(name,description) values(?,?)",nativeQuery = true)
    void addCategory(String name,String desc);
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = " delete from category where name=?",nativeQuery = true)
    void deleteCategory(String name);
}
