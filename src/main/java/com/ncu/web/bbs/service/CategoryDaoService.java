package com.ncu.web.bbs.service;

import com.ncu.web.bbs.dao.CategoryDao;
import com.ncu.web.bbs.entity.category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryDaoService {
    @Autowired
    private CategoryDao categoryDao;

    public List<category>   findAll(){
        return categoryDao.findAll();
    }
    public category getCategoryByname(String name){
        return categoryDao.getCategoryByName(name);
    }

    public void updateCategory(String desc,String name){
        categoryDao.updateCategory(desc,name);
    }
    public void addCategory(String name,String description){
        categoryDao.addCategory(name,description);
    }
    public void deleteCategory(String name){
        categoryDao.deleteCategory(name);
    }
}
