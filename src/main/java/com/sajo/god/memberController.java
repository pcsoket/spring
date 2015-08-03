package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sajo.dao.MemberDAO;
import com.sajo.dto.MemberDTO;


@Controller("MemberController")
public class MemberController {

	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@RequestMapping(value="/write.action",method={RequestMethod.GET,RequestMethod.POST})
	public String write(HttpServletRequest req,HttpServletResponse resp,MemberDTO dto){
		
		if(dto==null){
			
			return "signIn";
			
		}
		
		dao.insertData(dto);
		
		return "shop";
	}
}
