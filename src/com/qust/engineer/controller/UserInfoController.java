package com.qust.engineer.controller;

import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Comparator;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.User;

@Controller
@RequestMapping("/user")
public class UserInfoController {
	@Autowired
	private UserMapper userMapper;
	
	@RequestMapping("/personal")
	public String checkInfo(@RequestParam("uname") String name,Model model) throws UnsupportedEncodingException{
		//依据传进来的用户名查找
//		String username=new String(name.getBytes("iso-8859-1"),"utf8");
		String username = name;
		User user=userMapper.selectByName(username);
		model.addAttribute("checkUser", user);
		List<User> users=userMapper.selectAll();
		Collections.sort(users, new MyComparator());
		for(int i=0;i<users.size();i++){
			if(users.get(i).getuId()==user.getuId()){
				model.addAttribute("active", i+1);
				break;
			}
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = dateFormat.format(user.getuDate());
		model.addAttribute("uDate", date);
		return "personal";
	}
	
	
	
	
	private class MyComparator implements Comparator<User>{
		@Override
		public int compare(User o1, User o2) {
			// TODO Auto-generated method stub
			return o2.getuGrowth()-o1.getuGrowth();
		}
	}
}
