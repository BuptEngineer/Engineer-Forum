package com.qust.engineer.controller;

import java.io.UnsupportedEncodingException;
import java.util.Collections;
import java.util.Comparator;
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
		String username=new String(name.getBytes("IS0-8859-1"),"utf8");
		User user=userMapper.selectByName(username);
		model.addAttribute("checkUser", user);
		//获取活跃度
		int growth=user.getuGrowthValue();
		List<User> users=userMapper.selectAll();
		Collections.sort(users, new MyComparator());
		for(int i=0;i<users.size();i++){
			if(users.get(i).getuId()==growth){
				model.addAttribute("active", i+1);
				break;
			}
		}
		return "personal";
	}
	
	private class MyComparator implements Comparator<User>{
		@Override
		public int compare(User o1, User o2) {
			// TODO Auto-generated method stub
			return o1.getuGrowthValue()-o2.getuGrowthValue();
		}
	}
}
