package com.sajo.god;

import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ComController{
	

	@RequestMapping(value="/shop_article.action")
	public String shop_article(){
		
		return "shop_article";
	}
	
	@RequestMapping(value="/article.action")
	public String article(){
		
		return "article";
	}
	
	@RequestMapping(value="/list.action")
	public String list(){
		
		return "list";
	}
	
	@RequestMapping(value="/created.action")
	public String created(){
		
		return "created";
	}
	

	


}
