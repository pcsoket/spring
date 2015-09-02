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
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //���ǿ��� �α���������������
		
		ModelAndView mav = new ModelAndView();
		
		if(logInfo==null){                                              //�α����� �ʿ��� �������� ���־���� ������� null������ ���� ������
			
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum()+"&message=" +"�α��κ�����!";
		}
		
		
		int numMax = dao.getMaxNum();
		
		dto.setConNum(numMax+1);
		
		int result = dao.checkContribution(dto);
		
		if(result>0){
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum()+"&message=�̹� ��õ�ϼ̽��ϴ�.";
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
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //���ǿ��� �α���������������
		
		if(logInfo!=null){                                              //�α����� �ʿ��� �������� ���־���� ������� null������ ���� ������
			if(logInfo.getGno()==gNo){
				int myContributionInfo=dao.myContribution(dto.getUserId());  //���̵� ���� �⿩��
				request.setAttribute("myContributionInfo", myContributionInfo);
			}
		}
		
		List<ContributionDTO> lists = dao.getContributionList(dto.getgNo());
		request.setAttribute("lists", lists);
		
		return "contributionInfo";
	}
}