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
import org.springframework.web.servlet.ModelAndView;

import com.sajo.util.MyUtil;
import com.sajo.dao.ContributionDAO;
import com.sajo.dto.ContributionDTO;
import com.sajo.dto.LoginDTO;


@Controller
public class ContributionController {
	
	@Autowired
	@Qualifier("contributionDAO")
	ContributionDAO dao;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value="/insertContribution.action", method={RequestMethod.POST,RequestMethod.GET})
	public String insert(ContributionDTO dto,HttpServletRequest request, HttpServletResponse response){
		
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		ModelAndView mav = new ModelAndView();
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum()+"&message=" +"로그인부터해!";
		}
		
		
		int numMax = dao.getMaxNum();
		
		dto.setConNum(numMax+1);
		
		int result = dao.checkContribution(dto);
		
		if(result>0){
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum()+"&message=이미 추천하셨습니다.";
		}
		
		dao.insertData(dto);
		
		return "redirect:/checkContribution.action?gNum=" + dto.getgNum()+"&message=";
	}

	
/*	@RequestMapping(value="/updateContribution.action",method={RequestMethod.GET,RequestMethod.POST})
	public String update(ContributionDTO dto, HttpServletRequest request,HttpServletResponse response){

	
		dao.updateContribution(dto.getgNum());
		
		return "redirect:/checkContribution.action?gNum=" + dto.getgNum();
	}*/
	
	@RequestMapping(value="/checkContribution.action",method={RequestMethod.GET,RequestMethod.POST})
	public String check(ContributionDTO dto,String message, HttpServletRequest request,HttpServletResponse response){
		System.out.println(dto.getgNum()+":::");
		int contribution = dao.printContribution(dto.getgNum());
		request.setAttribute("contribution", contribution);
		request.setAttribute("message", message);

		return "board/contribution/contribution_update";
	}
	
	@RequestMapping(value="/contributionInfo.action",method={RequestMethod.GET,RequestMethod.POST})
	public String contributionInfo(ContributionDTO dto,int gNo, HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		if(logInfo!=null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			if(logInfo.getGno()==gNo){
				int myContributionInfo=dao.myContribution(dto.getUserId());  //아이디에 대한 기여도
				request.setAttribute("myContributionInfo", myContributionInfo);
			}
		}
		
		List<ContributionDTO> lists = dao.getContributionList(dto.getgNo());
		request.setAttribute("lists", lists);
		
		return "contributionInfo";
	}
}