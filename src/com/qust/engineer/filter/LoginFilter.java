package com.qust.engineer.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.qust.engineer.entity.User;

public class LoginFilter implements Filter {

    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	public void destroy() {
		// TODO Auto-generated method stub
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		/*
		 * 1.获取session中的user
		 * 2.若不为null，则放行，若为null，则重定向到登录页面
		 */
		HttpServletRequest req = (HttpServletRequest)request;
		User user = (User) req.getSession().getAttribute("session_user");
		if(user!=null){
			chain.doFilter(request, response);//放行
		}else{
			HttpServletResponse res = (HttpServletResponse)response;
			res.sendRedirect("/engineer/jsps/user/login.jsp");
		}
		
	}


	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
