package test;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;  

  
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class testDao {  
    private static Logger logger = Logger.getLogger(testDao.class);  
    private ApplicationContext ac = null;   
 
  
    @Test
    public void test1() {  
        System.out.println("Hello world!");
    }
}  