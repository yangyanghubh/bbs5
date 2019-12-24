package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.service.UserDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping(value ="/userLogin" )
public class UserLoginController {

    @Autowired
    private UserDaoService userDaoService;

    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String userLogin(@RequestParam("username") String username,
                            @RequestParam("password") String password,
                            @RequestParam("key") String key,
                            HttpSession session){
        String code;
        try {
            code = session.getAttribute("code").toString();
        } catch (NullPointerException e) {
            code = "";
        }
        if(code.equals(key)){
            if(userDaoService.getUserByName(username)!=null){
                if(userDaoService.isRight(username,password)){
                    session.setAttribute("user",userDaoService.getUserByName(username));
                    session.setAttribute("username",username);
                    return "redirect:/user_main";
                }else{
                    session.setAttribute("msg","登录失败，请检查用户名和密码是否正确");
                    return "/user_login";
                }
            }else{
                session.setAttribute("msg","用户不存在，请注册");
                return "redirect:/user_login";
            }
        }
        else {
            session.setAttribute("msg","验证码错误");
            return "redirect:/user_login";
        }

    }

//    @RequestMapping(value = "/login",method = RequestMethod.POST)
//    public ModelAndView userLogin(HttpServletRequest request, ModelAndView modelAndView, HttpSession session){
//        String username=request.getParameter("username");
//        String password=request.getParameter("password");
//        if(userDaoService.getUserByName(username)!=null){
//            if(userDaoService.isRight(username,password)){
//                modelAndView.setViewName("user_main");
//                session.setAttribute("username",username);
//                session.setAttribute("password",password);
//                return modelAndView;
//            }else{
//                System.out.println("cuowu1");
//                modelAndView.addObject("message","登录失败，请检查用户名和密码是否正确");
//                modelAndView.setViewName("user_login");
//                return modelAndView;
//            }
//        }else{
//            System.out.println("cuowu2");
//            modelAndView.addObject("message", "用户不存在,请注册");
//            modelAndView.setViewName("user_login");
//            return modelAndView;
//        }
//    }
}
