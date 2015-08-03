package com.sajo.god;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IdeaMainController {
	
	@RequestMapping(value="/ideamain.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req, String data) throws Exception{
		
		
				
		return "ideamain";
	}
	
	@RequestMapping(value="/shop.action")
	public String bigDoor(){
		
		
		return "shop";
	}
	
	@RequestMapping(value="/signin.action")
	public String signin(){
		
		
		return "signIn";
	}
	
	@RequestMapping(value="/header.action")
	public String header(){
		
		
		return "header";
	}
	
	@RequestMapping(value="/invent.action")
	public String invent(){
		
		
		return "Invent";
	}
	
	@RequestMapping(value="/myPage.action")
	public String myPage(){
		
		
		return "shopMyPage";
	}
	
	@RequestMapping(value="/orderList.action")
	public String orderList(){
		
		
		return "shopOrderList";
	}

}
