package com.ncu.web.bbs.dao;


import com.ncu.web.bbs.entity.article;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.ArrayList;
import java.util.List;

@Repository
public interface ArticleDao extends JpaRepository<article,Integer> {
    @Query(value = "select * from article where category_id =?",nativeQuery = true)
     ArrayList<article> findAllByCategory_id(int id);

    @Query(value = "select * from article where authorid =?",nativeQuery = true)
     ArrayList<article> findAllByAuthorID(int id);

    //已使用
    @Query(value = "select * from article where title =?",nativeQuery = true)
    article findAllByTitle(String title);
    //已使用
    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "update article set istop=? where title=?",nativeQuery = true)
    void changeIsTop(int istop,String title);

    @Query(value = "select * from article where title=?",nativeQuery = true)
   article getArticleByName(String name);
    @Query(value = "select * from article where id =?",nativeQuery = true)
    article findById(int id);

    @Query(value = "select * from article where istop=1",nativeQuery = true)
    ArrayList<article> findByTop();

    @Query(value = "select * from article order by time_istop desc,id desc",nativeQuery = true)
    List<article> findList();

    @Transactional
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE article ar SET ar.title=?2,ar.time_isTop=?3,ar.isTop=?4 where ar.id =?1")
    void updateArticle(int id, String title, long time_isTop, int isTop);

}
