package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.entity.article;
import com.ncu.web.bbs.entity.user;
import com.ncu.web.bbs.service.ArticleDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;

@Controller
@RequestMapping(value = "/PostArticle")
public class UserPostArticleController {

    @Autowired
    private ArticleDaoService articleDaoService;

    @ResponseBody
    @RequestMapping(value = "/MyPost",method = RequestMethod.POST)
    public ModelAndView postArticle(HttpServletRequest request, ModelAndView modelAndView, HttpSession session){
        article article=new article();
        user user=(user)session.getAttribute("user");
        article.setTitle(request.getParameter("title"));
        article.setKeyword(request.getParameter("keyword"));
        article.setSummary(request.getParameter("summary"));
        article.setContext(request.getParameter("content"));
        article.setCategory_id(Integer.valueOf(request.getParameter("type")));
        article.setAuthorID(((user) session.getAttribute("user")).getId());
        article.setTime(new Date());
        //article.setAuthorID(user.getId());
        session.setAttribute("article",article);
        articleDaoService.saveArticle(article);
        modelAndView.setViewName("user_main");
        return modelAndView;
    }
}
