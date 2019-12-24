package com.ncu.web.bbs.service;

import com.ncu.web.bbs.dao.CommentDao;
import com.ncu.web.bbs.entity.category;
import com.ncu.web.bbs.entity.comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

@Service
public class CommentDaoService {
    @Autowired
    private CommentDao commentDao;

    public ArrayList<comment> findAllByArticle_id(int id){

        return commentDao.findAllByArticle_id(id);
    }
    public void addComment(comment comment1){

        commentDao.save(comment1);
    }
    public void deleteComment(int id){
        commentDao.deleteById(id);
    }
    public void deleteAllCommentByArticleID(int id){
        commentDao.deleteAll(id);
    }
    public ArrayList<comment> findAll(){
        return (ArrayList<comment>) commentDao.findAll();
    }


    public void changeStatus(int status,String name){
        commentDao.changeStatus(status,name);
    }
    public comment findByContext(String context){
      return   commentDao.findCommentByContext(context);
    }

}
