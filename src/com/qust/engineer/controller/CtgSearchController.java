package com.qust.engineer.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qust.engineer.dao.AdminMapper;
import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.PostMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Admin;
import com.qust.engineer.pojo.Category;
import com.qust.engineer.pojo.Post;
import com.qust.engineer.pojo.User;

@Controller
@RequestMapping("/posts")
public class CtgSearchController {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private UserMapper userMapper;
	@Autowired
	private CategoryMapper catetoryMapper;
	
	@RequestMapping("/search")
	public String SearchPostsAccordingTitle(HttpServletRequest request,Model model) throws UnsupportedEncodingException{
		String keyword=new String(request.getParameter("keyword").getBytes("iso-8859-1"), "utf-8");
		List<Post> postsLinked=postMapper.selectByTitle(keyword);
		List<Category> categoriesLinked=new ArrayList<Category>();
		List<User> usersLinked=new ArrayList<>();
		for(int i=0;i<postsLinked.size();i++){
			Category category=catetoryMapper.selectByPrimaryKey(postsLinked.get(i).getCtgId());
			categoriesLinked.add(category);
			User admin=userMapper.selectByPrimaryKey(postsLinked.get(i).getuId());
			usersLinked.add(admin);
		}
		model.addAttribute("categoriesLink",categoriesLinked);
		model.addAttribute("usersLink",usersLinked);
		model.addAttribute("postsLink", postsLinked);
		return "search";
	}
}
