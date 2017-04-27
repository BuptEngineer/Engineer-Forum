package com.qust.engineer.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.servlet.BaseServlet;

import com.qust.engineer.entity.Category;
import com.qust.engineer.service.CategoryService;

public class CategoryServlet extends BaseServlet {
	private CategoryService ctgService = new CategoryService();
	/*
	 * 查看所有的分类
	 */
	public String findAll(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> categorys = ctgService.findAll();
		req.setAttribute("categorys", categorys);
		return "f:/jsps/category/all.jsp";
	}
	
	/**
	 * 按分类来查找所有的路线
	 */
	public String findRoutesByCtg(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctg_id = request.getParameter("ctg_id");
		if(ctg_id!=null){
			try {
				 Integer.parseInt(ctg_id);
			} catch (NumberFormatException e) {
				return "r:/jsps/404page/404.html";
			}
		}else{
			return "r:/jsps/404page/404.html";
		}
			
		try {
			Category category = ctgService.findRoutesByCtg(ctg_id);
			request.setAttribute("category", category);
		} catch (IndexOutOfBoundsException e) {
			Category category = ctgService.findByCtg_id(ctg_id);
			request.setAttribute("category", category);
		}
		return "f:/jsps/route/rlist.jsp";
	}
	
	public String findHotTapic(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		List<Category> categorys = ctgService.findHotTag();
		req.setAttribute("categorys", categorys);
		return "f:/jsps/category/list.jsp";
	}
	
	public String load(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String ctg_id = req.getParameter("ctg_id");
		if(ctg_id==null){
			return "r:/jsps/404page/404.html";
		}
		try {
			 Integer.parseInt(ctg_id);
		} catch (NumberFormatException e) {
			return "r:/jsps/404page/404.html";
		}
		Category category = ctgService.findByCtg_id(ctg_id);		
		req.setAttribute("category", category);
		return "f:/";
	}
}
