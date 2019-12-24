package com.ncu.web.bbs.service;

import com.ncu.web.bbs.dao.ArticleDao;
import com.ncu.web.bbs.entity.article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ArticleDaoService {
    @Autowired
    private ArticleDao articleDao;
   public List<article>  findAll(){
       return  articleDao.findAll();
   }
    public List<article> getArticleByName(String name){
        List<article> articles =new ArrayList<>();
        articles.add(articleDao.getArticleByName(name));
        return articles;
    }
   public ArrayList<article> findAllBytypeId(int id){
       return articleDao.findAllByCategory_id(id);
   }

   public ArrayList<article> findAllByAuthorID(int id){
       return articleDao.findAllByAuthorID(id);
   }
   public void deleteArticle(int id){
      articleDao.deleteById(id);
   }
   public void saveArticle(article article1){
       articleDao.save(article1);
   }
   public article findByTitle(String name){
     return   articleDao.findAllByTitle(name);
   }
   public void changeIstop(int istop,String title){
       articleDao.changeIsTop(istop,title);
   }
    public List<article> findByTop() {
        return articleDao.findByTop();
    }

    public List<article> findList() {
        return articleDao.findList();
    }
    public article  findById(int id){
        return  articleDao.findById(id);
    }
    public void updateArticle(article article) {
        articleDao.updateArticle(article.getId(),article.getTitle(),article.getTime_isTop(),article.getIsTop());
    }
}
