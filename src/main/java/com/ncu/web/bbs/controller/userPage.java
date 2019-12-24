package com.ncu.web.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class userPage {
    @RequestMapping(value = "/user_Index")
    public String as1(){
        return "user_Index";
    }

    @RequestMapping(value = "/user_information")
    public String as2(){
        return "user_information";
    }
    @RequestMapping(value = "/user_login")
    public String as3(){
        return "user_login";
    }

    @RequestMapping(value = "/user_main")
    public String as4(){
        return "user_main";
    }
    @RequestMapping(value = "/user_posting")
    public String as5(){
        return "user_posting";
    }

    @RequestMapping(value = "/user_register")
    public String as6(){
        return "user_register";
    }
    @RequestMapping(value = "/myArticle")
    public String as7(){
        return "myArticle";
    }

    @RequestMapping(value = "article")
    public String as8(){

        return "article";
    }

}
