package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.entity.comment;
import com.ncu.web.bbs.service.CommentDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Comparator;

@Controller
@RequestMapping(value = "/comment")
public class commentController {
    @Autowired
    private CommentDaoService commentDaoService;

    @RequestMapping(value = "/findAllByArticleID", method = RequestMethod.GET)
    @ResponseBody
    public ArrayList<comment> findAllByArticleID(@RequestParam("name") String name){
        ArrayList<comment> comments =commentDaoService.findAllByArticle_id(Integer.parseInt(name));
        comments.sort(Comparator.comparing(comment::getTime_comment));
        return comments;
    }
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAll(ModelAndView modelAndView){
        ArrayList<comment> comments =commentDaoService.findAll();
        comments.sort(Comparator.comparing(comment::getTime_comment));
        modelAndView.setViewName("commentManager");
        modelAndView.addObject("comments",comments);
        return modelAndView;
    }

    @RequestMapping(value = "/findSome", method = RequestMethod.GET)
    public ModelAndView  findSome(@RequestParam("name") String name,ModelAndView model){
        System.out.println("访问"+name);
        model.addObject("comments",commentDaoService.findAllByArticle_id(Integer.parseInt(name)));
        model.setViewName("commentManager");
        return model;
    }
    @RequestMapping(value = "/addComment", method = RequestMethod.GET)
    public void addComment(HttpServletRequest request){
        comment a =new comment();
        a.setUser_id(Integer.parseInt(request.getAttribute("userid").toString()));
        a.setArticle_id(request.getAttribute("articleID").toString());
        a.setContext(request.getAttribute("context").toString());
        a.setStatus(0);
        a.setTime_comment(new Timestamp(System.currentTimeMillis()));
        commentDaoService.addComment(a);
    }
    @RequestMapping(value = "/deleteComment", method = RequestMethod.GET)
    public void deleteCommentByid(@RequestParam("id") String id){
        commentDaoService.deleteComment(Integer.parseInt(id));
    }

    @RequestMapping(value = "/updateStatus")
    public void getJson(@RequestBody comment comment1){
        commentDaoService.changeStatus(comment1.getStatus(),comment1.getContext());

    }

    @RequestMapping(value = "/getcommentByContext", method = RequestMethod.GET)
    @ResponseBody
    public comment getUserByName(String context){
        return commentDaoService.findByContext(context);
    }


}
