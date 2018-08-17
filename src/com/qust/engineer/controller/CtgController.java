package com.qust.engineer.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/categories") // the first filter key of url
public class CtgController {
	@RequestMapping("/add") // the second filter key of url
    public String userShow(HttpServletRequest request, Model model){
        return "addctg"; // 
    }
}
