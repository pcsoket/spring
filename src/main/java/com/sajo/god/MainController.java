package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class MainController {
	
	@RequestMapping(value="/main.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req,HttpServletResponse res) throws Exception{
		
		return "main";
	}
	
	@RequestMapping(value="/golist.action",method={RequestMethod.GET,RequestMethod.POST})
	public String golist(HttpServletRequest req,HttpServletResponse res) throws Exception{
		
		return "shop/golist";
	}
}
