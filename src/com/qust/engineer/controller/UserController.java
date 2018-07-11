package com.qust.engineer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user") // 这里的 user 也需要在 user 文件夹下
public class UserController {

    @RequestMapping("/userShow")
    public String userShow(HttpServletRequest request, Model model){

        model.addAttribute("user", "sgy");
        return "test"; // 返回页面可以带有文件夹
    }
    
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model){
    	
        return "login"; // 返回页面可以带有文件夹
    }


}