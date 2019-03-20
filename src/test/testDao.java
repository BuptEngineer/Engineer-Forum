package test;

import static org.junit.Assert.assertNotNull;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.PostMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Category;
import com.qust.engineer.pojo.Post;
import com.qust.engineer.pojo.User;
 

  
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring-mybatis.xml"}) 
public class testDao{
	@Resource
    public UserMapper userMapper;

    @Resource
    public CategoryMapper categoryMapper;
    
    @Resource
    public PostMapper postMapper;

    
    @Test
    public void testUserMapper() {
//        assertNotNull("selectByName:", userMapper.selectByName("1"));
//        User record = new User();
//        record.setuId(1);
//        record.setuOnline(false);
//        userMapper.updateByPrimaryKeySelective(record);
//        record = userMapper.selectByName("梅林");
//        assertNotNull("growth:", record.getuName());
//        assertNotNull("users:", userMapper.selectAll());
//        assertNotNull("date:", record.getuDate());
//        record.setuName("insert");
//        record.setuEmail("e");
//        record.setuId(10);
//        userMapper.insert(record);
//        record.setuName("insertS");
//        record.setuId(20);
//        record.setuEmail("e1");
//        userMapper.insertSelective(record);
    }
    
    
    @Test
    public void testPostMapper() {
    	Post post = new Post();
    	post.setCtgId(1);
    	post.setpDesc("Android");
    	post.setpName("Android");
    	postMapper.insert(post);

    	List<Post> lp = postMapper.selectByTitle("");
    	for (Post post2 : lp) {
			System.out.println(post2.getUser().getuName() + post2.getUser().getuId());
		}
    }
    
    
    @Test
    public void testCtgMapper() {
//    	System.out.println(categoryMapper.insert(new Category("程序员", "程序员之间交流的家园")));
//    	assert 7 == categoryMapper.selectByCtgName("程序员");
//    	List<Category>  ret = categoryMapper.selectAllCtg();
//    	for (Category category : ret) {
//    		assertNotNull("exists:", category.getCtgName());
//		}
    }
    
}
