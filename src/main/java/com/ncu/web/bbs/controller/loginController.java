package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.service.AdminDaoService;
import com.ncu.web.bbs.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/login")
public class loginController {
        @Autowired
    private AdminDaoService adminDaoService;
    @RequestMapping(value = "/admincheck", method = RequestMethod.POST)
    public ModelAndView adminlogin(HttpServletRequest request, ModelAndView modelAndView) {
        String name = request.getParameter("user");
        String password = request.getParameter("password");
        String key = request.getParameter("key");
        String code = "";
        try {
            code = request.getSession().getAttribute("code").toString();
        } catch (NullPointerException e) {
            code = "";
        }
        System.out.println(key);
        System.out.println(code);

        if (name == null || "".equals(name) || password == null || "".equals(password) || code == null || "".equals(code)) {
            modelAndView.setViewName("login");
            return modelAndView;

        } else {
//            if (code.equals(key)) {
                if(true){
                if (adminDaoService.getAdminByName(name) != null) {
                    if (adminDaoService.isRight(name, password)) {

                        if (adminDaoService.getAdminByName(name).getLimitation() == 0) {
                            modelAndView.setViewName("index");
                            return modelAndView;
                        } else {
                            modelAndView.setViewName("indexsuper");
                            return modelAndView;
                        }
                    }
                    modelAndView.addObject("message", "密码错误！！！！");
                    modelAndView.setViewName("login");
                    return modelAndView;

        }else {
         modelAndView.addObject("message", "用户不存在！！！！");
         modelAndView.setViewName("login");
         return modelAndView;
                }
     }
     else {
         modelAndView.setViewName("login");
         modelAndView.addObject("message", "验证码错误！！！！");
         return modelAndView;
            }
        }
    }
    @Autowired
    private UserDaoService userDaoService;
    @RequestMapping(value = "/usercheck", method = RequestMethod.POST)
    public String userlogin(HttpServletRequest request){
        String name =request.getParameter("user");
        String password = request.getParameter("password");
        String key = request.getParameter("key");
        System.out.println(name+password);
        if(userDaoService.isRight(name,password)){
            return "success";//用户验证成功跳转的页面
        }
        else
            return "error";//用户验证失败跳转的页面
    }
}
