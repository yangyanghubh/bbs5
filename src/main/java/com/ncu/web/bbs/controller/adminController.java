package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.entity.admin;
import com.ncu.web.bbs.service.AdminDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/admin")
public class adminController {
    @Autowired
    private AdminDaoService adminDaoService;



//已使用
    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAll(ModelAndView modelAndView){
        modelAndView.setViewName("adminManager");
        modelAndView.addObject("admins",adminDaoService.findAll());
        return modelAndView;
    }
    @RequestMapping(value = "/findSome", method = RequestMethod.GET)
    public ModelAndView  findSome(@RequestParam("name") String name,ModelAndView model){
        System.out.println("访问"+name);
        model.addObject("admins",adminDaoService.findSome(name));
        model.setViewName("adminManager");
        return model;
    }



    //
    @ResponseBody
    @RequestMapping(value = "/getAdminByName", method = RequestMethod.GET)
    public admin getAdminByName(String uname){
        return adminDaoService.getAdminByName(uname);
    }


    @RequestMapping(value = "/isRight", method = RequestMethod.GET)
    public @ResponseBody
    boolean isRight(@RequestParam("name") String name, @RequestParam("password") String password){
        return (adminDaoService.isRight(name, password));
    }

    @RequestMapping(value = "/updateAdmin")
    public void getJson(@RequestBody admin admin1){
        adminDaoService.updateAdmin(admin1.getTel(),admin1.getEmail(),admin1.getUsername());

    }

    @RequestMapping(value = "/addAdmin")
    public void addCategory(@RequestBody admin admin1){
        adminDaoService.addAdmin(admin1.getUsername(),
                admin1.getPassword(),admin1.getTel(),admin1.getEmail());

    }
    @RequestMapping(value = "/deleteAdmin")
    public void deleteAdmin(String uname){
        adminDaoService.deleteAdmin(uname);

    }

}
