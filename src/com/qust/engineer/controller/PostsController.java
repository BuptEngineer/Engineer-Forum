package com.qust.engineer.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.PostMapper;
import com.qust.engineer.pojo.Category;
import com.qust.engineer.pojo.Post;
import com.qust.engineer.pojo.User;

@Controller
@RequestMapping("/posts") // the first filter key of url
public class PostsController {
	@Autowired
	private PostMapper postMapper;
	
	@Autowired
	CategoryMapper ctgMapper;
	
	@RequestMapping("/addPost") // the first filter key of url
	public String addPost(HttpServletRequest request, Model model) {
		// search all  categories
		// put them in collection, then post to the page
		List<Category> ctgs = ctgMapper.selectAllCtg();
		model.addAttribute("ctgs",ctgs);
		return "addPost";
    }
	
	// https://blog.csdn.net/lutinghuan/article/details/46820023
	// convert Object to json String 
	@RequestMapping(value = "/add", method = RequestMethod.POST,  produces = "text/html;charset=UTF-8")
	@ResponseBody
    public String addPost(HttpServletRequest request, @RequestBody Post post) {
		System.out.println(post.getpName());
		// extract user id from session
		// if there is no user in session, redirect to login page
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("session_user");
		if(user == null) {
			return "您没有登录，请先登录， http://localhost:8080/Engineer-Growth-Route/user/login";
		}
		post.setuId(user.getuId());
		postMapper.insert(post);
		return "添加成功";
    }
	
	@RequestMapping("/show") // the second filter key of url
    public String showPost(HttpServletRequest request, Model model){
        return "show"; // 
    }
}