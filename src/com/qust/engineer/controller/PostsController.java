package com.qust.engineer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/posts") // the first filter key of url
public class PostsController {
	@RequestMapping("/add") // the second filter key of url
    public String addPost(HttpServletRequest request, Model model){
        return "addPost"; // 
    }
	
	@RequestMapping("/show") // the second filter key of url
    public String showPost(HttpServletRequest request, Model model){
        return "show"; // 
    }
}