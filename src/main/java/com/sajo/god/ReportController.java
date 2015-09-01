package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sajo.dao.ReportDAO;
import com.sajo.dto.LoginDTO;

@Controller
public class ReportController {

	@Autowired
	@Qualifier("reportDAO")
	ReportDAO rpdao;
	
	@RequestMapping(value="/report.action")
	public String report (HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		
		LoginDTO dto = (LoginDTO)session.getAttribute("logInfo");
		
		//String mid=dto.getUserId();
		
		
		return "report";
		
	}
	
}
