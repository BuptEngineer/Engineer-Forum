package com.qust.engineer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qust.engineer.dao.CategoryMapper;
import com.qust.engineer.pojo.Category;

@Controller
@RequestMapping("/categories")
public class CtgController {
	
	@Autowired
	CategoryMapper ctgMapper;
	
	@RequestMapping("/add")
    public String showAddCtgPage(HttpServletRequest request, Model model){
        return "addctg";
    }
	
	@RequestMapping(value = "/addCtg", method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
	public String addCtg(HttpServletRequest request){
		ctgMapper.insert(new Category((String)request.getParameter("ctgName"),
								(String)request.getParameter("ctgDesc")));
		return "类添加成功";
	}
	
	@RequestMapping(value = "ajaxValidateCtgName", method = RequestMethod.POST,produces = "text/html;charset=UTF-8")
	@ResponseBody  // 返回消息主体
	public String ajaxValidateClassName(HttpServletRequest request ) {
		// 接收到 category，判断是否已经存在于数据库中
		return ctgMapper.selectByCtgName((String)request.getParameter("ctgName") ) > 0 ? "true":"";
		
	}
	
}
