package test;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.qust.engineer.dao.AdminMapper;
import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Category;
import com.qust.engineer.pojo.User;
 

  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"}) 
public class testDao{
	@Resource
    public UserMapper userMapper;
    @Resource
    public AdminMapper adminMapper;
    @Resource
    public CategoryMapper categoryMapper;

    
    @Test
    public void testUserMapper() {
        User record = new User();
        record.setuEmail("1");
        record.setuPwd("1");
        assert 1 == userMapper.selectByEmailPwd(record);
        
        assert 1 == userMapper.selectByEmail("1");
    }
    
    @Test
    public void testCtgMapper() {
    	System.out.println(categoryMapper.insert(new Category("程序员", "程序员之间交流的家园")));
    	assert 4 == categoryMapper.selectByCtgName("程序员");
    }
    
}