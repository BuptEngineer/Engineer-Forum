package test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qust.engineer.dao.AdminMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Admin;
import com.qust.engineer.pojo.User;
 

  
@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class testDao {  
    private static Logger logger = Logger.getLogger(testDao.class);  
    private ApplicationContext ac = null;
    @Resource
    public UserMapper userMapper;
    @Resource
    public AdminMapper adminMapper;
    
    
    @Test
    public void testUserMapper() {
        Admin a = adminMapper.selectByPrimaryKey(1);
        System.out.println(a.toString());
//        u.setuEmail("4");
//        userMapper.updateByPrimaryKeySelective(u);
    }
}  