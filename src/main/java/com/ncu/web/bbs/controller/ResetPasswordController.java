package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/resetPassword")
public class ResetPasswordController {

    @Autowired
    private UserDaoService userDaoService;

    @RequestMapping(value = "/reset",method = RequestMethod.POST)
    public String resetPassword(@RequestParam("newPassword") String newPassword, HttpSession session){

        userDaoService.resetPassword(newPassword,(String)session.getAttribute("username"));

        return "forward:/WEB-INF/jsp/user_main.jsp";
    }
}
