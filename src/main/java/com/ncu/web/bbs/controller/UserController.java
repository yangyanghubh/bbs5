package com.ncu.web.bbs.controller;


import com.ncu.web.bbs.entity.ResponseResult;
import com.ncu.web.bbs.entity.comment;
import com.ncu.web.bbs.entity.user;
import com.ncu.web.bbs.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.sql.Timestamp;

@Controller
@RequestMapping(value = "/user")
public class UserController {
    @Autowired
    private UserDaoService userDaoService;
    @RequestMapping(value = "/getUserByID", method = RequestMethod.GET)
    @ResponseBody
    public user getUserByID(@RequestParam("id") String id){
        return userDaoService.getUserInfoByID(Integer.parseInt(id));
    }


    @RequestMapping(value = "/isRight", method = RequestMethod.GET)
    @ResponseBody
    public boolean isRight(@RequestParam("name") String name,@RequestParam("password") String password){
        return userDaoService.isRight(name,password);

    }
    //yang根据名字获取单个用户
    @RequestMapping(value = "/getUserByName", method = RequestMethod.GET)
    @ResponseBody
    public user getUserByName(String uname){
        System.out.println(uname);
        return userDaoService.getUserByName(uname);

    }
    //yang返回所有用户的信息
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView  findAll(ModelAndView model){
        System.out.println("访问");
       model.addObject("users",userDaoService.findAll());
       model.setViewName("userManager");
        return model;
    }

    //yang通过姓名搜索用户信息
    @RequestMapping(value = "/findSome", method = RequestMethod.GET)
    public ModelAndView  findSome(@RequestParam("name") String name,ModelAndView model){
        System.out.println("访问"+name);
        model.addObject("users",userDaoService.getUserListByName(name));
        model.setViewName("userManager");
        return model;
    }
    @RequestMapping(value = "/deleteUser", method = RequestMethod.GET)
    @ResponseBody
    public void deleteUser(@RequestParam("name") String name){
        userDaoService.deleteUser(name);
    }

    //yang更新用户信息
    @RequestMapping(value = "/updateUser")
    public void getJson(@RequestBody user user1){
        userDaoService.updateUser(
                user1.getNickname(),
                user1.getTel(),
                user1.getPosition(),
                user1.getIntegral(),
                user1.getNature(),
                user1.getStatus(),
                user1.getUsername());
    }
    @RequestMapping(value = "editInfo",method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult editInfo(user user, HttpSession session){
        user user1 =(user)session.getAttribute("user");
        user.setId(user1.getId());
        userDaoService.editInfo(user);

        return ResponseResult.success();
    }

    @RequestMapping(value = "/getMyself", method = RequestMethod.POST)
    @ResponseBody
    public ResponseResult getMyself(HttpSession session){
        user user =(user)session.getAttribute("user");
        return ResponseResult.success(userDaoService.getByID(user.getId()));

    }

}
