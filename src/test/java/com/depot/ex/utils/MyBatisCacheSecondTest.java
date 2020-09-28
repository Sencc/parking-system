package com.depot.ex.utils;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.depot.ex.admin.entity.User;
import com.depot.ex.admin.service.UserService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-web.xml","classpath:spring/spring-service.xml","classpath:spring/spring-dao.xml"})  
public class MyBatisCacheSecondTest
{
    private static final Logger logger = LoggerFactory.getLogger(MyBatisCacheSecondTest.class);    

    @Autowired
    private  UserService service;

    /*
     * ???????????
     */
    @Test
    public void testCache2() {
        User page1 = service.findUserByUsername("zhangsan");
        logger.info(page1.getName());

        User page2 = service.findUserByUsername("zhangsan");
        logger.info(page2.getName());

    }   

}