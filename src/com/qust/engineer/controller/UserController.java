package com.qust.engineer.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.qust.engineer.service.UserService;
import com.qust.engineer.utils.VerifyCodeUtils;


@Controller
@RequestMapping("/user") // the first filter key of url
public class UserController {
	 
//	@Autowired // register a bean in spring
//	private UserService userService; // UserService is not ready.
	
    @RequestMapping("/userShow") // the second filter key of url
    public String userShow(HttpServletRequest request, Model model){
        model.addAttribute("user", "sgy");
        return "test"; // 
    }
    
    @RequestMapping("/login")//login page
    public String login(HttpServletRequest request, Model model){
    	
        return "login";
    }
    
    @RequestMapping("/loginVerification")
    public String loginVerification(HttpServletRequest request, Model model){
    	
        return "register"; 
    }
    
    @RequestMapping("/register")
    public String register(HttpServletRequest request, Model model){
    	
        return "register";
    }
    
    /**
     * @param request
     * @param model
     * @return
     */
    @RequestMapping("/registerVerification")
    public String registerVerification(HttpServletRequest request, Model model){
    	// construct a user
    	// get attributes from request
    	// verify it
    	// then redirect to another page, like index page.
    	request.getAttribute("");
        return "register"; 
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