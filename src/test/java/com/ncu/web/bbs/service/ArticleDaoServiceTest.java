package com.ncu.web.bbs.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class ArticleDaoServiceTest {
    @Autowired
    private ArticleDaoService articleDaoService;


    @Test
    public void findAll() {
        System.out.println(articleDaoService.findAll());
    }
}