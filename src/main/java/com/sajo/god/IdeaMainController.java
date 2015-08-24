package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
public class IdeaMainController {
	
	@RequestMapping(value="/ideamain.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req, String data) throws Exception{
		
		
				
		return "ideamain";
	}
	
/*	@RequestMapping(value="/ideaArticle.action")
	public String ideaArticle(HttpServletRequest req,HttpServletResponse resp,HttpSession session){
		
		
		
		
		
		return "/board/ideaArticle";
	}*/
	
	@RequestMapping(value="/header.action")
	public String header(){
		
		
		return "header";
	}
	
	@RequestMapping(value="/invent.action")
	public String invent(){
		
		
		return "invent";
	}

}
