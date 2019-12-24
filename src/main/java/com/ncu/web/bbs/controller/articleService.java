package com.ncu.web.bbs.controller;


import com.ncu.web.bbs.dao.CategoryDao;

import com.ncu.web.bbs.entity.ResponseResult;
import com.ncu.web.bbs.entity.article;
import com.ncu.web.bbs.entity.comment;
import com.ncu.web.bbs.entity.user;
import com.ncu.web.bbs.pojo.aritcleList;
import com.ncu.web.bbs.pojo.commentList;
import com.ncu.web.bbs.service.ArticleDaoService;
import com.ncu.web.bbs.service.CommentDaoService;
import com.ncu.web.bbs.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import java.sql.Timestamp;
import java.util.ArrayList;

import java.util.Comparator;
import java.util.Date;
import java.util.List;


@Controller
@RequestMapping(value = "/article")
public class articleService {

    @Autowired
    private ArticleDaoService articleDaoService;
    @Autowired
    private CommentDaoService commentDaoService;
    @Autowired
    private CategoryDao categoryDao;
    @Autowired
    private UserDaoService userDaoService;





    //已使用
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView  findAll(ModelAndView modelAndView){
        modelAndView.setViewName("articleManager");
        modelAndView.addObject("articles",articleDaoService.findAll());
        return modelAndView;
    }
    @RequestMapping(value = "/findSome", method = RequestMethod.GET)
    public ModelAndView  findSome(@RequestParam("name") String name,ModelAndView model){
        System.out.println("访问"+name);
        model.addObject("articles",articleDaoService.getArticleByName(name));
        model.setViewName("articleManager");
        return model;
    }



    @RequestMapping(value = "/findAllTypeid", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<article>  findAllByTypeID(@RequestParam("id") String id){
        ArrayList<article> articles =articleDaoService.findAllBytypeId(Integer.parseInt(id));
        articles.sort(Comparator.comparing(article::getTime));

        return articles;
    }



//已使用
    @RequestMapping(value = "/findAllByTitle", method = RequestMethod.GET)
    @ResponseBody
    public article findAllByAuthorID(String uname){
   return   articleDaoService.findByTitle(uname);
    }


    //已使用
    @RequestMapping(value = "/updateIsTop")
    public void getJson(@RequestBody article article1){
        articleDaoService.changeIstop(article1.getIsTop(),article1.getTitle());
        System.out.println(article1.getIsTop()+article1.getTitle());

    }



    @RequestMapping(value = "/delete", method = RequestMethod.GET)
    @ResponseBody
    public void deleteArticle(@RequestParam("id") String id){
        articleDaoService.deleteArticle(Integer.parseInt(id));
        commentDaoService.deleteAllCommentByArticleID(Integer.parseInt(id));


    }




    @RequestMapping(value = "/addArticle", method = RequestMethod.GET)
    @ResponseBody
    public void addArticle(HttpServletRequest request){
        article article1 =new article();
        article1.setTitle(request.getAttribute("title").toString());
        article1.setComment(Integer.parseInt(request.getAttribute("comment").toString()));
        article1.setKeyword(request.getAttribute("key").toString());
        article1.setSummary(request.getAttribute("summary").toString());
        article1.setContext(request.getAttribute("context").toString());
        Timestamp time =new Timestamp(System.currentTimeMillis());
        article1.setTime(time);
        article1.setPraise_points(Integer.parseInt(request.getAttribute("praise_points").toString()));
       article1.setCategory_id(Integer.parseInt(request.getAttribute("category_id").toString()));
       article1.setIsTop((Integer) request.getAttribute("istop"));
       if(article1.getIsTop()==1){
           article1.setTime_isTop(System.currentTimeMillis());
       }
       article1.setAuthorID(Integer.parseInt(request.getAttribute("authorid").toString()));
         articleDaoService.saveArticle(article1);
    }
    @RequestMapping(value = "getList",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getList(String  cateId){
        List<article> list;
        if (cateId!=null && Integer.valueOf(cateId)>0){
            list = articleDaoService.findAllBytypeId(Integer.valueOf(cateId));
        }else{
            list = articleDaoService.findList();
        }

        List<aritcleList> aritcleList = new ArrayList<>();
        for (int i=0;i<list.size();i++){
            aritcleList aritcleListTmp = new aritcleList();
            aritcleListTmp.setId(list.get(i).getId());
            aritcleListTmp.setTitle(list.get(i).getTitle());
            aritcleListTmp.setSummary(list.get(i).getSummary());
            aritcleListTmp.setComment(list.get(i).getComment());
            aritcleListTmp.setTime(list.get(i).getTime());
            aritcleListTmp.setName(categoryDao.getOne(list.get(i).getCategory_id()).getName());
            aritcleListTmp.setCateId(list.get(i).getCategory_id());
            aritcleListTmp.setIsTop(list.get(i).getTime_isTop()>0?1:0);
            aritcleList.add(aritcleListTmp);
        }
        return ResponseResult.success(aritcleList);
    }
    @RequestMapping(value = "getListTop",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getListTop(){
        List<article> list;

        list = articleDaoService.findByTop();

        List<aritcleList> aritcleList = new ArrayList<>();
        for (int i=0;i<list.size();i++){
            aritcleList aritcleListTmp = new aritcleList();
            aritcleListTmp.setId(list.get(i).getId());
            aritcleListTmp.setTitle(list.get(i).getTitle());
            aritcleListTmp.setSummary(list.get(i).getSummary());
            aritcleListTmp.setComment(list.get(i).getComment());
            aritcleListTmp.setTime(list.get(i).getTime());
            aritcleListTmp.setName(categoryDao.getOne(list.get(i).getCategory_id()).getName());
            aritcleListTmp.setCateId(list.get(i).getCategory_id());
            aritcleListTmp.setIsTop(list.get(i).getTime_isTop()>0?1:0);
            aritcleList.add(aritcleListTmp);
        }
        return ResponseResult.success(aritcleList);
    }
    @RequestMapping(value = "getCate",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getCate(){

        return ResponseResult.success(categoryDao.findAll());
    }

    @RequestMapping(value = "getContent",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getContent(String  id){
        if (id==null && Integer.valueOf(id)<=0){
            return ResponseResult.fail();
        }
        article content = articleDaoService.findById(Integer.valueOf(id));

        aritcleList aritcleListTmp = new aritcleList();
        aritcleListTmp.setId(content.getId());
        aritcleListTmp.setTitle(content.getTitle());
        aritcleListTmp.setSummary(content.getSummary());
        aritcleListTmp.setComment(content.getComment());
        aritcleListTmp.setTime(content.getTime());
        aritcleListTmp.setName(categoryDao.getOne(content.getCategory_id()).getName());
        aritcleListTmp.setCateId(content.getCategory_id());
        aritcleListTmp.setNickname(userDaoService.getUserInfoByID(content.getAuthorID()).getNickname());
        aritcleListTmp.setContent(content.getContext());
        aritcleListTmp.setIsTop(content.getTime_isTop()>0?1:0);
        aritcleListTmp.setJinghua(content.getIsTop());
        return ResponseResult.success(aritcleListTmp);
    }
    @RequestMapping(value = "getcomment",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getcomment(String  id){
        if (id==null && Integer.valueOf(id)<=0){
            return ResponseResult.fail();
        }
        ArrayList<comment> list = commentDaoService.findAllByArticle_id(Integer.parseInt(id));
        List<commentList> commentLists  = new ArrayList<>();
        for (int i =0 ;i<list.size();i++){
            commentList commentListTmp = new commentList();
            commentListTmp.setId(list.get(i).getId());
            commentListTmp.setContext(list.get(i).getContext());
            commentListTmp.setTime_comment(list.get(i).getTime_comment());
            commentListTmp.setNickName (userDaoService.getUserInfoByID(list.get(i).getUser_id()).getNickname());

            commentLists.add(commentListTmp);
        }


        return ResponseResult.success(commentLists);
    }
    @RequestMapping(value = "addComment",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult addComment(String context,String id, HttpSession session){
        if (id==null && Integer.valueOf(id)<=0){
            return ResponseResult.fail("文章id获取失败");
        }
        if (context==null){
            return ResponseResult.fail("内容不能为空");
        }

        comment commentTmp = new comment();
        user user = (user) session.getAttribute("user");
        if(user==null){
            return ResponseResult.fail("您还未登录请先登录后评论！");
        }
        commentTmp.setUser_id(user.getId());
        commentTmp.setContext(context);
        commentTmp.setTime_comment(new Timestamp(System.currentTimeMillis()));
        commentTmp.setArticle_id(id);

        commentDaoService.addComment(commentTmp);
        return ResponseResult.success();
    }
    @RequestMapping(value = "editArticle",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult editArticle(String id,String title,int is_top,int jinghua, HttpSession session){
        if (id==null && Integer.valueOf(id)<=0){
            return ResponseResult.fail("文章id获取失败");
        }
        if (title==null || title==""){
            return ResponseResult.fail("标题不能为空");
        }

        article article = new article();
        article.setId(Integer.valueOf(id));
        article.setTitle(title);
        article.setIsTop(jinghua);
        if(is_top==1){
            article.setTime_isTop(new Date().getTime());
        }else{
            article.setTime_isTop(0);
        }

        articleDaoService.updateArticle(article);

        return ResponseResult.success();
    }

}
