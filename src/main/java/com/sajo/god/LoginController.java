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
	public ModelAndView login(String pagePath){
		
		ModelAndView mav = new ModelAndView();
		
		if(pagePath!=null){

			mav.addObject("pagePath", pagePath);          // �α������� ���ư� ���� ����

		}
		
		mav.setViewName("login");
		
		return mav;
		
	}
	
	@RequestMapping(value="/login_ok.action",method={RequestMethod.POST})
	public String login_ok(String pagePath,HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		String userId = req.getParameter("userId");
		String userPwd = req.getParameter("userPwd");
		
		session.removeAttribute("message");

		dto = dao.getList(userId);
		

		
		if(dto==null){
			
			session.setAttribute("message", "���̵� ������ �����ϴ�.");
	
			return "redirect:/login.action";
	
		}else if(!dto.getUserPwd().equals(userPwd)){
			
			session.setAttribute("message", "��й�ȣ�� ��ġ���� �ʽ��ϴ�.");
			return "redirect:/login.action";
		}
		
	//	System.out.println(dto.getGno());
		
		session.setAttribute("logInfo", dto);
	//	System.out.println(pagePath+":page");
		
		if(!pagePath.equals("")){
			return pagePath;	                           // �α������� ���ư� �� ����
		}
		
		return "redirect:/category.action";
		
	}
	
	@RequestMapping(value="/logout.action")
	public String logout(HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		session.removeAttribute("logInfo");
		session.invalidate();
		
		return "redirect:/category.action";
	}
	
	@RequestMapping(value="/logout1.action")
	public String logout1(HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		session.removeAttribute("logInfo");
		session.invalidate();
		
		return "redirect:/ideaMain.action";
	}
	
	@RequestMapping(value="/findId.action")
	public String findId(){
		
		
		return "findId";
	}
	
	@RequestMapping(value="/findId_ok.action")
	public String findId_ok(HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		String userName = req.getParameter("userName");
		String userEmail = req.getParameter("userEmail");
		
		req.removeAttribute("message");
		req.removeAttribute("message1");
		
		dto = dao.getListId(userName,userEmail);
		
		if(userName!=null){
		
		req.setAttribute("message","ã���� ID�� [" + dto.getUserId() + "] �Դϴ�.");
		req.setAttribute("message1","ã���� Password�� [" + dto.getUserPwd() + "] �Դϴ�.");
		
		return "findId";
		}
		
		return "findId";

	}

}
