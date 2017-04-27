package com.qust.engineer.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.qust.engineer.utils.JsonUtil;
import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.Route;
import com.qust.engineer.entity.User;
import com.qust.engineer.service.CategoryService;
import com.qust.engineer.service.RouteService;

public class RouteServlet extends BaseServlet {
	private RouteService routeService = new RouteService();
	//添加学习路线
	public String add(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 添加的路线信息有：路线名称，路线的概述，路线对应的分类
		 */
		Route route = CommonUtils.toBean(request.getParameterMap(), Route.class);	
		User user = (User) request.getSession().getAttribute("session_user");
		if(user==null){
			request.setAttribute("msg", "您还没有登录呢，我们还没有来得及加过滤器！");
			return "f:/jsps/user/login.jsp";
		}
		route.setUser(user);
		
		String ctg_id = request.getParameter("ctg_id");
		if(ctg_id==null){
			request.setAttribute("msg", "分类信息丢失不能添加！");
			return "f:/jsps/route/add.jsp";
		}
		Category cate = new Category();
		cate.setCtg_id(Integer.parseInt(ctg_id));
		route.setCategory(cate);
		//System.out.println(route);
		routeService.add(route);
		request.setAttribute("msg", "恭喜您添加成功，赶快分享给您的好友吧！");
		return "f:/jsps/msg.jsp";

	}
	
	//ajaxAddMore,查找全部课程时，加载更多
	public String ajaxAddMore(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.获取参数begin
		 * 2.通过begin调用service的findall方法，将返回的list赋值给Pagebean对象pb
		 * 3.向客户端传递校验结果
		 */
		String begin = request.getParameter("begin");
		String ctg_id = request.getParameter("ctg_id");
		System.out.println(begin+ctg_id);
		List<Route> routes = new ArrayList<Route>();
		if(ctg_id!=null){
			routes = routeService.ajaxAddMore(begin,ctg_id);
		}

		String routesJSON = JsonUtil.list2json(routes);
			System.out.println(routesJSON);
		if(routesJSON.equals("[]")){
			response.getWriter().print(false);
		}
		else 
			response.getWriter().print(routesJSON);
		return null;
	}
	
	//编辑路线的部分信息 暂时先不改所属的分类
	public String edit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Route route = CommonUtils.toBean(request.getParameterMap(), Route.class);
		routeService.edit(route);
		return find(request,response);
	}
	//按id查找路线
	public String find(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("rt_id");
		int rt_id;
		if(id==null){
			return "r:/jsps/404page/error.jsp";
		}
		try {
			 rt_id = Integer.parseInt(id);
		} catch (NumberFormatException e) {
			return "r:/jsps/404page/error.jsp";
		}
		Route route = routeService.find(rt_id);
		request.setAttribute("route", route);
		return "f:/jsps/route/detail.jsp";
	}
	
	
}
