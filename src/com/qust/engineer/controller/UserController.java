package com.qust.engineer.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.qust.engineer.dao.UserMapper;
import com.qust.engineer.pojo.User;
import com.qust.engineer.utils.VerifyCodeUtils;


@Controller
@RequestMapping("/user") // the first filter key of url
public class UserController {
	 
//	@Autowired // register a bean in spring
//	private UserService userService; // UserService is not ready.
	
	@Resource
	private UserMapper userMapper;
    
    @RequestMapping("/login")//login page
    public String login(){
        return "login";
    }
    @RequestMapping("/personal")
    public String personal(){
        return "personal";
    }
    @RequestMapping("/quit")
    public String quit(HttpServletRequest request){
    	HttpSession session = request.getSession();
    	session.setAttribute("session_user", null);
        return "redirect:/";
    }
    
    @RequestMapping("/loginVerification")
    public String loginVerification(HttpServletRequest request, User user){
    	int n = userMapper.selectByEmailPwd(user);
    	if(n == 1){
	    	HttpSession session = request.getSession();
	    	user.setuName(userMapper.selectNameByEmail(user.getuEmail()));
	    	user.setuPwd(""); // 娓呴櫎瀵嗙爜
	    	session.setAttribute("session_user", user);
    	}else{
    		request.setAttribute("msg", "wrong email or wrong password");
    		return "login";
    	}
        return "redirect:/"; 
    }
    
    @RequestMapping("/registerVerification")
    public String registerVerification(HttpServletRequest request, User user){
    	userMapper.insert(user);
    	HttpSession session = request.getSession();
    	session.setAttribute("session_user", user);
        return "redirect:/"; 
    }
    
    @RequestMapping("/register")
    public String register(HttpServletRequest request, Model model){
    	
        return "register";
    }
    
    
    @RequestMapping(value = "/ajaxValidateEmail",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
    public String ajaxValidateEmail(HttpServletRequest request){    	
    	String email = (String)request.getParameter("u_email");
    	System.out.println(email);
    	if(userMapper.selectByEmail(email) > 0)
    		return "";
    	else
    		return "true";
    }
    
    /**
     * @param request
     * @param model
     * @return
     */
    @RequestMapping(value = "/verifyCode",method = RequestMethod.POST, produces = "text/html;charset=UTF-8")
	@ResponseBody
    public String verifyCode(HttpServletRequest request){
    	String verifyCode = (String)request.getParameter("verifyCode");
    	HttpSession  session = request.getSession();
    	String rightCode = (String)session.getAttribute("verifyCode");
    	
    	if(verifyCode.toLowerCase().equals(rightCode.toLowerCase()))
    		return "true";
    	else
    		return "";
    }
    
    @RequestMapping("/verifyCode")
    public void verificationCode(HttpServletRequest request,HttpSession session, HttpServletResponse response) throws IOException{
    	// define the w and h of code image
    	int width = 100;
    	int height = 30;
    	// set response header
    	// browser shouldn't take this image into cache 
    	response.setHeader("Pragma", "No-cache");
        response.setHeader("Cache-Control", "no-cache");
        response.setDateHeader("Expires", 0);
        response.setContentType("image/png"); // the type of image is png
		String verifyCode = VerifyCodeUtils.generateVerifyCode(4);
		// the key code.
		// write the image stream into response.getOutputStream()
		// then code picture will show in the web page
		VerifyCodeUtils.outputImage(width, height, response.getOutputStream(), verifyCode);
		// put the verifyCode into session
		// check on it when user finished verification code
		session.setAttribute("verifyCode", verifyCode);
    }
}