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

import junit.framework.Assert;
 

  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml", "classpath:spring-mvc.xml"}) 
public class testDao{
	@Resource
    public UserMapper userMapper;
    @Resource
    public AdminMapper adminMapper;
    @Resource
    public CategoryMapper categoryMapper;

    
    @Test
    public void testUserMapper() {
        System.out.println(userMapper.selectByPrimaryKey(1));
    }
    
    @Test
    public void testCategoryMapper() {
    	// ����
//    	Category c = new Category("����Ա", "��� coding ��Ա��һ�ķǼ������������");
//    	categoryMapper.insert(c);
//    	int n = categoryMapper.selectByCtgName("����Ա");
//    	assert n == 1:"�ɹ�";
    }
    
}