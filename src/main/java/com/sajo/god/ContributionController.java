package com.sajo.god;



import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sajo.util.MyUtil;
import com.sajo.dao.ContributionDAO;
import com.sajo.dto.ContributionDTO;


@Controller
public class ContributionController {
	
	@Autowired
	ContributionDAO dao;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value="/insertContribution.action", method={RequestMethod.POST,RequestMethod.GET})
	public String insert(ContributionDTO dto,HttpServletRequest request, HttpServletResponse response){
		
		int numMax = dao.getMaxNum();
		dto.setConNum(numMax+1);
		dao.insertData(dto);
		
		return "redirect:/group/article.action?gNum=" + dto.getgNum();
	}

	
	@RequestMapping(value="/updateContribution.action",method={RequestMethod.GET,RequestMethod.POST})
	public String update(ContributionDTO dto, HttpServletRequest request,HttpServletResponse response) throws Exception{

	
			
		dao.updateContribution(dto);
		
		return "redirect:/group/article.action?gNum=" + dto.getgNum();

		
	}
	
}