package com.ncu.web.bbs.dao;

import com.ncu.web.bbs.entity.category;
import com.ncu.web.bbs.entity.comment;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;

@Repository
public interface CommentDao  extends JpaRepository<comment,Integer> {
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "select * from comment where article_id =?",nativeQuery = true)
    ArrayList<comment> findAllByArticle_id(int id);
    @Query(value = "delete from comment where article_id =?",nativeQuery = true)
    void deleteAll(int id);

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update comment set status=? where content=?",nativeQuery = true)
    void changeStatus(int status,String context);


    @Query(value = "select * from comment where content =?",nativeQuery = true)
    comment findCommentByContext(String context);


}
