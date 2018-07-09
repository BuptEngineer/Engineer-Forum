package com.qust.engineer.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping("/user")
public class UserController {

    @RequestMapping("/userShow")
    public String toIndex(HttpServletRequest request, Model model){

        model.addAttribute("user", "sgy");

        return "test"; // 返回页面可以带有文件夹
    }

}