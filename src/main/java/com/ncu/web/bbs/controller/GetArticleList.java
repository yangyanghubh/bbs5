package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.entity.article;
import com.ncu.web.bbs.service.ArticleDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping(value="/getArticle")
public class GetArticleList {
    @Autowired
    private ArticleDaoService articleDaoService;

    @RequestMapping(value = "/getArticles",method = RequestMethod.POST)
    @ResponseBody
    public List<article> getArticleList(){
        return articleDaoService.findAll();
    }
}
