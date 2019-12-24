package com.ncu.web.bbs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AdminPage {


    @RequestMapping(value = "/articleManager")
    public String as1(){
        return "articleManager";
    }

    @RequestMapping(value = "/adminManager")
    public String as2(){
        return "adminManager";
    }
    @RequestMapping(value = "/categoryManager")
    public String as3(){
        return "categoryManager";
    }

    @RequestMapping(value = "/commentManager")
    public String as4(){
        return "commentManager";
    }
    @RequestMapping(value = "/index")
    public String as5(){
        return "index";
    }

    @RequestMapping(value = "/login")
    public String as6(){
        return "login";
    }
    @RequestMapping(value = "/userManager")
    public String as7(){
        return "userManager";
    }
    @RequestMapping(value = "/loginsuper")
    public String as8(){
        return "loginsuper";
    }
}
