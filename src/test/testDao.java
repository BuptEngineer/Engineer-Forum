package test;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.context.ApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qust.engineer.dao.AdminMapper;
import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Admin;
import com.qust.engineer.pojo.Category;
import com.qust.engineer.pojo.User;
 

  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"})  
  
public class testDao{
    private static Logger logger = Logger.getLogger(testDao.class);  
    private ApplicationContext ac = null;
    @Resource
    public UserMapper userMapper;
    @Resource
    public AdminMapper adminMapper;
    @Resource
    public CategoryMapper categoryMapper;

    
    @Test
    public void testUserMapper() {
        int k = 0;
        User user = new User();
        user.setuEmail("s@q.com");
        user.setuPwd("123123");
        k = userMapper.selectByEmailPwd(user);
        System.out.println("数量" + k);
    }
}