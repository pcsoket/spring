package com.sajo.god;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class ShopMainController {
	
	@RequestMapping(value="/shopmain.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req, String data) throws Exception{
		
		
				
		return "shopmain";
	}
	
	@RequestMapping(value="/basket.action")
	public String bigDoor(){
		
		
		return "basket";
	}
	
	
}
