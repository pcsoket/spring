package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dao.LoginDAO;
import com.sajo.dto.LoginDTO;

@Controller
public class LoginController {
	
	@Autowired
	@Qualifier("loginDAO")
	LoginDAO dao;
	
	@RequestMapping(value="/login.action")
	public ModelAndView login(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("login");
		
		return mav;
		
	}
	
	@RequestMapping(value="/login_ok.action",method={RequestMethod.POST})
	public String login_ok(HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		session.removeAttribute("message");
		
		dto = dao.getList(userId);
		
		if(dto==null){
		
				session.setAttribute("message", "아이디 정보가 없습니다.");
		
		return "redirect:/login.action";
		
		}else if(!dto.getUserPwd().equals(userPwd)){
			
			session.setAttribute("message", "비밀번호가 일치하지 않습니다.");
			return "redirect:/login.action";
		}
		
		session.setAttribute("userId", userId);
		session.setAttribute("userPwd", userPwd);
		
		return "redirect:/shopmain.action";
		
	}
	
	@RequestMapping(value="/logout.action")
	public String logout(HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		session.removeAttribute("userId");
		session.removeAttribute("userPwd");
		
		return "redirect:/shopmain.action";
	}

}
