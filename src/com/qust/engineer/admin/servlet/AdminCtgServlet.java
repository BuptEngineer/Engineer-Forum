package com.qust.engineer.admin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.qust.engineer.entity.Category;
import com.qust.engineer.service.CategoryService;
import com.qust.engineer.service.exception.CategoryException;

public class AdminCtgServlet extends BaseServlet {
	private CategoryService ctgService = new CategoryService();
	public String findAll(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Category> categorys = ctgService.findAll();
		request.setAttribute("categorys", categorys);
		return "f:/adminjsps/category/list.jsp";
	}
	public String editPre(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctg_id = request.getParameter("ctg_id");
		if(ctg_id!=null)
				Integer.parseInt(ctg_id);
		else{
			request.setAttribute("msg", "找不到分类信息！");
			return "f:/adminjsps/msg.jsp";
		}
		
		Category category = ctgService.findByCtg_id(ctg_id);
		request.setAttribute("category", category);
		return "f:/adminjsps/category/edit.jsp";

	}
	//修改分类
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Category category = CommonUtils.toBean(request.getParameterMap(),Category.class);
		if(category==null){
			request.setAttribute("msg", "提交的信息为空！");
			return "f:/adminjsps/msg.jsp";
		}
		ctgService.edit(category);
		return findAll(request,response);
	}
	//删除分类
	public String delete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String ctg_id = request.getParameter("ctg_id");
		if(ctg_id!=null)
				Integer.parseInt(ctg_id);
		else{
			request.setAttribute("msg", "找不到分类信息！");
			return "f:/adminjsps/msg.jsp";
		}
		//若抛出异常，则说明分类下面有路线，不能删除
		try {
			ctgService.delete(ctg_id);
		} catch (CategoryException e) {
			request.setAttribute("msg", e.getMessage());
			return "f:/jsps/msg.jsp";
		}
		return findAll(request,response);
	}
	

}
