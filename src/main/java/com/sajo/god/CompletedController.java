package com.sajo.god;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sajo.dao.CompletedDAO;
import com.sajo.dao.ImageDAO;
import com.sajo.dto.CompletedDTO;
import com.sajo.util.MyUtil;

@Controller
public class CompletedController {
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@Autowired
	@Qualifier("completedDAO")
	CompletedDAO cpdao;
	
	@RequestMapping(value="/compl/created.action")
	public String compl_created(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
		
		return "invent/created";
		
	}
	
	
	@RequestMapping(value="/completed.action")
	public String completed(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
		List<CompletedDTO> lists = cpdao.getbest();
		
		lists = idao.imageForcList(lists);
		
		req.setAttribute("clists", lists);
		
		return "invent/completed";
	}

}
