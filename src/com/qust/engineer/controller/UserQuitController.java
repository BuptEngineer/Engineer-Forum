package com.qust.engineer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.User;

@Controller
@RequestMapping("/user")
public class UserQuitController{
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/quit")
	public String quit(HttpServletRequest request){
		//获取当前用户的名称
		User  username=(User) request.getSession().getAttribute("session_user");
		//通过用户id进行更新用户表
		username.setuOnline(false);
		userMapper.updateByPrimaryKey(username);
		//清除session用户信息
		request.getSession().removeAttribute("session_user");
		return "../index";
	}
}
