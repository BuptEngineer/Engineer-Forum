package com.qust.engineer.servlet;



import java.io.IOException;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.itcast.commons.CommonUtils;
import cn.itcast.servlet.BaseServlet;

import com.qust.engineer.entity.Category;
import com.qust.engineer.entity.User;
import com.qust.engineer.service.CategoryService;
import com.qust.engineer.service.UserService;
import com.qust.engineer.service.exception.UserException;

public class UserServlet extends BaseServlet {

	private UserService userService = new UserService();
	/**
	 * ajax的注册邮箱校验
	 * @param request
	 * @param response
	 * @return
	 * @throws ServletException
	 * @throws IOException
	 */
	public String ajaxValidateEmail(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.获取参数email
		 * 2.调用service方法，返回结果
		 * 3.将结果输出到浏览器
		 */
		String email = request.getParameter("u_email");
		boolean b = userService.ajaxValidateEmail(email);
		response.getWriter().print(b);
		return null;
	}
	public String ajaxValidateVerifyCode(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.获取参数verifycode
		 * 
		 * 3.将结果输出到浏览器
		 */
		String verifyCode = request.getParameter("verifyCode");
		String vcode = (String) request.getSession().getAttribute("vCode");
		//System.out.println(verifyCode+"   "+vcode);
		boolean b = false;
		if(verifyCode.equalsIgnoreCase(vcode))
			b = true;
		response.getWriter().print(b);
		return null;
	}
	public String regist(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		/*
		 * 1.封装表单数据到user
		 * 2.对表单项进行二次校验，若有错误，保存信息到request域，转发到regist.jsp页面
		 * 3.否则调用service的regist方法完成注册,若有错误，保存错误信息到UserException中并转发
		 * 4.保存成功信息到msg.jsp
		 */
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
//		System.out.println(form);
		Map<String, String> errors = validateRegist(form,request.getSession());
		System.out.println(errors.size());
		if(errors.size()>0){
			request.setAttribute("form", form);//保存数据用于回显
			request.setAttribute("errors", errors);
			return "f:/jsps/user/regist.jsp";
		}
		userService.regist(form);
		request.setAttribute("msg", "恭喜您注册成功，请到邮箱激活！");
		
		//return "f:/jsps/msg.jsp";
		return "f:/index.jsp";
	}
	
	//邮箱激活
	public String activation(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
		/*1.获取激活码参数	
		 * 2.通过激活码调用service的方法，若激活码无效，则保存错误信息到request域中
		 * 3.激活成功，重定向到msg.jsp显示成功信息
		 */
		String code = request.getParameter("u_actnCode");
		try {
			userService.activation(code);
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			return "f:/jsps/user/msg.jsp";
		}
		
		request.setAttribute("msg", "恭喜您激活成功，请马上登陆！");
		return "f:/jsps/user/msg.jsp";
	}
	
	//登录
	public String login(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {	
		/*
		 * 1.封装表单数据到form中
		 * 2.对表单数据进行校验，若有错误，保存错误信息到request域中，转发到login.jsp
		 * 3.设置用户session，
		 * 4.重定向到首页
		 */
		
		User form = CommonUtils.toBean(request.getParameterMap(), User.class);
		System.out.println(form.getU_email());
		System.out.println(request.getAttribute("url"));

		User user_all = userService.login(form.getU_email());
//		
//		CategoryService ctgService = new CategoryService();
//		List<Category> categorys = ctgService.findMain();
//		request.setAttribute("categorys", categorys);
//		
		if(user_all.getU_pwd()!=null&&form.getU_pwd()!=null)
		if(user_all.getU_pwd().equals(form.getU_pwd())){
			request.setAttribute("success", true);
			User user = new User();
			user.setU_id(user_all.getU_id());
			user.setU_name(user_all.getU_name());
			user.setU_email(user_all.getU_email());
			request.getSession().setAttribute("session_user", user);
			//保存用户名到cookie中
			String username = user.getU_name();
			username = URLEncoder.encode(username, "utf-8");
			Cookie cookie=new Cookie("u_name", username);
			cookie.setMaxAge(1000*60*60*24*15);//设置cookie的寿命为15天
			response.addCookie(cookie);
			return "f:/main.jsp";
		}
			request.setAttribute("success","密码或账号不正确！");
			return "f:/main.jsp";
	}
	//修改密码
	public String updatePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {	
		/*
		 * 1.封装表单数据到user对象中
		 * 	对表单数据进行校验，若有错误，保存错误信息和form到request中，转发到pwd.jsp
		 * 2.获取当前用户的session值
		 * 3调用service方法，若有异常，保存异常信息到request中
		 * 4.转发到msg.jsp
		 */
		User form=CommonUtils.toBean(request.getParameterMap(), User.class);
		//校验未完成
		if(!form.getNewpassword().equals(form.getConfirmpass())){
			request.setAttribute("form", form);
			request.setAttribute("reloginpassError", "两次密码不一致！");
			return "f:/jsps/user/pwd.jsp";
		}
		User user=(User) request.getSession().getAttribute("session_user");
		try {
			userService.updatePassword(user.getU_id(),form.getU_pwd(),
					form.getNewpassword());
			request.setAttribute("msg", "修改密码成功！");
			return "f:/jsps/msg.jsp";
		} catch (UserException e) {
			request.setAttribute("msg", e.getMessage());
			return "f:/jsps/msg.jsp";
		}
	}
	//用户退出
	public String quit(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {		
		request.getSession().invalidate();
		return "f:/jsps/user/login.jsp";
	}
		
		
	//注册的表单校验
	private Map<String, String> validateRegist(User user,HttpSession session) {
		Map<String, String> errors=new HashMap<String, String>();
		String email=user.getU_email();
		if(email==null)
		{
			errors.put("email", "邮箱不能为空！");
		}else if(!email.matches("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")){
			errors.put("email", "邮箱格式错误！");
		}else if(!userService.ajaxValidateEmail(user.getU_email())){
			errors.put("email", "该邮箱已被注册！");
		}
		//昵称校验
		String username=user.getU_name();
		if(username==null||username.trim().isEmpty())
		{
			errors.put("username", "昵称不能为空！");
		}else if(username.length()<2||username.length()>20)
		{
			errors.put("username", "用户昵称长度必须在2~20！");
		}
		//登录密码
		String password=user.getU_pwd();
		if(password==null||password.trim().isEmpty())
		{
			errors.put("password", "密码不能为空！");
		}else if(password.length()<6||password.length()>20)
		{
			errors.put("password", "密码长度必须在6~20之间！");
		}		
		//确认登录密码
		String confirmpass=user.getConfirmpass();
		if(confirmpass==null||confirmpass.trim().isEmpty())
		{
			errors.put("confirmpass", "确认密码不能为空！");
		}else if(!confirmpass.equals(user.getU_pwd()))
		{
			errors.put("confirmpass", "两次密码不一致！");
		}
		
		
		//验证码校验
		String verifyCode=user.getVerifyCode();
		String vCode=(String)session.getAttribute("vCode");
//		if(verifyCode==null||verifyCode.trim().isEmpty()){
//			errors.put("verifyCode", "验证码不能为空！");
//		}else if(!verifyCode.equalsIgnoreCase(vCode))
//		{
//			errors.put("verifyCode", "验证码错误！");
//		}		
		return errors;
	}
	
	//登录表单校验
	private Map<String, String> validateLogin(User form,HttpSession session) {
		Map<String, String> errors=new HashMap<String, String>();
		String email=form.getU_email();
		if(email==null||email.trim().isEmpty())
		{
			errors.put("email", "邮箱不能为空！");
		}else if(!email.matches("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")){
			errors.put("email", "邮箱格式错误！");
		}else if(userService.ajaxValidateEmail(email)){
			errors.put("email", "用户不存在！");
			return 	errors;
		}
		User user=userService.login(form.getU_email());
		//登录密码
		String password=form.getU_pwd();
		if(password==null||password.trim().isEmpty())
		{
			errors.put("password", "密码不能为空！");
		}else if(password.length()<6||password.length()>20)
		{
			errors.put("password", "密码长度必须在6~20之间！");
		}else if(!form.getU_pwd().equals(user.getU_pwd())){
			errors.put("password", "密码错误！");
		}
		//验证码校验
		String verifyCode=form.getVerifyCode();
		String vCode=(String)session.getAttribute("vCode");
		/*if(verifyCode==null||verifyCode.trim().isEmpty()){
			errors.put("verifyCode", "验证码不能为空！");
		}else if(!verifyCode.equalsIgnoreCase(vCode))
		{
			errors.put("verifyCode", "验证码错误！");
		}*/
		return errors;
	}
}
