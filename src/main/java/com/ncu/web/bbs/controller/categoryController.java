package com.ncu.web.bbs.controller;

import com.ncu.web.bbs.entity.category;
import com.ncu.web.bbs.service.CategoryDaoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/category")
public class categoryController {

    @Autowired
    private CategoryDaoService categoryDaoService;


    @RequestMapping(value = "/findAll", method = RequestMethod.GET)
    public ModelAndView findAll(ModelAndView modelAndView){
        modelAndView.setViewName("categoryManager");
        modelAndView.addObject("categories",categoryDaoService.findAll());

        return modelAndView;
    }
    @RequestMapping(value = "/findAllagain", method = RequestMethod.GET)
    public ModelAndView findAllagain(ModelAndView modelAndView){
        modelAndView.addObject("categories",categoryDaoService.findAll());
        modelAndView.setViewName("categoryManager");
        return modelAndView;
    }
    @RequestMapping(value = "/getCategoryByName", method = RequestMethod.GET)
    @ResponseBody
    public category getUserByName(String uname){
        System.out.println(uname);
        return categoryDaoService.getCategoryByname(uname);

    }
    @RequestMapping(value = "/updateCategory")
    public void updateCategory(@RequestBody category category1){
       categoryDaoService.updateCategory(category1.getDescription(),category1.getName());

    }

    @RequestMapping(value = "/addCategory")
    public void addCategory(@RequestBody category category1){
        categoryDaoService.addCategory(category1.getName(),category1.getDescription());
    }

    @RequestMapping(value = "/deleteCategoryByName")
    public void deleteCategory(String uname){
                categoryDaoService.deleteCategory(uname);
    }

}
