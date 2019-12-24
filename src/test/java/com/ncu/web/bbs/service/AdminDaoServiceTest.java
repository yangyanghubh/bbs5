package com.ncu.web.bbs.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;


@RunWith(SpringRunner.class)
@SpringBootTest
public class AdminDaoServiceTest {
    @Autowired
    private AdminDaoService adminDaoService;

    @Test
    public void findAll() {

        System.out.println(adminDaoService.findAll());
    }


    @Test
    public void saveAdmin() {
        adminDaoService.saveAdmin("as", "asd", "1", "as",
                "as", "as");
    }

    @Test
    public void isRight() {
        System.out.println(adminDaoService.isRight("yang", "asd"));
    }

//    @Test
//    public void setPassword() {
//        adminDaoService.setPassword("asdss","yang");
//    }
}