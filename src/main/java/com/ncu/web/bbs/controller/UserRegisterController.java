package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.entity.user;
import com.ncu.web.bbs.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value="/userRegister")
public class UserRegisterController {

    @Autowired
    private UserDaoService userDaoService;

    @ResponseBody
    @RequestMapping(value = "/saveUser",method = RequestMethod.POST)
    public ModelAndView saveUser(HttpServletRequest request, ModelAndView modelAndView, HttpSession session){
        user user=new user();
        if(userDaoService.getUserByName(request.getParameter("username"))==null){
            user.setUsername(request.getParameter("username"));
            user.setPassword(request.getParameter("password"));
            user.setTel(request.getParameter("tel"));
            user.setEmail(request.getParameter("email"));
            userDaoService.saveUser(user);
            modelAndView.setViewName("user_login");
            return modelAndView;
        }else{
            System.out.println("error");
            session.setAttribute("msg2","用户已存在");
            modelAndView.setViewName("user_register");
            return modelAndView;
        }
    }
}
