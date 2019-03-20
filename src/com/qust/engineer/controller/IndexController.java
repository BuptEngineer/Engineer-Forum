package com.qust.engineer.controller;

import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.dao.PostMapper;
import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.Category;
import com.qust.engineer.pojo.Post;
import com.qust.engineer.pojo.User;

@Controller
@RequestMapping({"/"})
public class IndexController {
	@Autowired
	private PostMapper postMapper;
	@Autowired
	private UserMapper userMapper;	
	@Autowired
	CategoryMapper ctgMapper;
	
	@RequestMapping({"/"}) // 首页帖子应该有排序算法
	public String SearchPostsAccordingTitle(HttpServletRequest request,Model model) throws UnsupportedEncodingException{
		List<Post> postsLinked=postMapper.selectByTitle("");
		model.addAttribute("postsLink", postsLinked);
		return "posts/search";
	}
}
