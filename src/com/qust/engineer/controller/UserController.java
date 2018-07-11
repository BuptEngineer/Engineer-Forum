package com.qust.engineer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/user") // ����� user Ҳ��Ҫ�� user �ļ�����
public class UserController {

    @RequestMapping("/userShow")
    public String userShow(HttpServletRequest request, Model model){

        model.addAttribute("user", "sgy");
        return "test"; // ����ҳ����Դ����ļ���
    }
    
    @RequestMapping("/login")
    public String login(HttpServletRequest request, Model model){
    	
        return "login"; // ����ҳ����Դ����ļ���
    }


}