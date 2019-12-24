package com.ncu.web.bbs.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;
@RunWith(SpringRunner.class)
@SpringBootTest
public class CategoryDaoServiceTest {
    @Autowired
    private CategoryDaoService categoryDaoService;
    @Test
    public void addCategory() {
        categoryDaoService.addCategory("asd","asd");

    }

    @Test
    public void deleteCategory() {
        categoryDaoService.deleteCategory("asd");
    }
}