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
//import org.springframework.web.servlet.ModelAndView;

import com.sajo.util.MyUtil;
import com.sajo.dao.CompletedDAO;
import com.sajo.dao.ContributionDAO;
import com.sajo.dao.GroupDAO;
import com.sajo.dao.InventDAO;
import com.sajo.dto.ContributionDTO;
import com.sajo.dto.LoginDTO;


@Controller
public class ContributionController {
	
	@Autowired
	@Qualifier("contributionDAO")
	ContributionDAO dao;
	
	@Autowired
	@Qualifier("inventDAO")
	InventDAO invdao;
	
	@Autowired
	@Qualifier("completedDAO")
	CompletedDAO compldao;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value="/insertContribution.action", method={RequestMethod.POST,RequestMethod.GET})
	public String insert(ContributionDTO dto,HttpServletRequest request, HttpServletResponse response){
		
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //���ǿ��� �α���������������
		
		//ModelAndView mav = new ModelAndView();
		
		if(logInfo==null){                                              //�α����� �ʿ��� �������� ���־���� ������� null������ ���� ������
			
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum();//+"&message=" +"�α��κ�����!";
		}
		
		
		int numMax = dao.getMaxNum();
		
		dto.setConNum(numMax+1);
		dto.setGrecomm(1);                     //��������
		
		int result = dao.checkContribution(dto);
		
		if(result>0){
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum();//+"&message=�̹� ��õ�ϼ̽��ϴ�.";
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
	//	System.out.println(dto.getgNum()+":::");
		int contribution = dao.printContribution(dto.getgNum());
		request.setAttribute("contribution", contribution);
		request.setAttribute("message", message);

		return "board/contribution/contribution_update";
	}
	
	@RequestMapping(value="/contributionInfo.action",method={RequestMethod.GET,RequestMethod.POST})
	public String contributionInfo(ContributionDTO dto, HttpServletRequest request,HttpServletResponse response){
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //���ǿ��� �α���������������
		
		if(logInfo!=null){                                              //�α����� �ʿ��� �������� ���־���� ������� null������ ���� ������
			if(logInfo.getGno()==dto.getgNo()){
				int myContributionInfo=dao.myContribution(logInfo.getUserId());  //���̵� ���� �⿩��
				request.setAttribute("myContributionInfo", myContributionInfo);
			}
		}
		
		List<ContributionDTO> lists = dao.getContributionList(dto.getgNo());
		request.setAttribute("lists", lists);
		
		System.out.println(dto.getgNo()+"gno");
		
		int Idea= invdao.getDataCount("gSubject", "", dto.getgNo(), "idea");                        //�� ���� ī��Ʈ
		int Sketch = invdao.getDataCount("gSubject", "", dto.getgNo(), "sketch");
		int d3d = invdao.getDataCount("gSubject", "", dto.getgNo(), "3D");
		
		request.setAttribute("Idea", Idea);
		request.setAttribute("Sketch", Sketch);
		request.setAttribute("d3d", d3d);
		
		return "contributionInfo";
	}
	
	
	//====================================================================complete
	@RequestMapping(value="/complContribution.action", method={RequestMethod.POST,RequestMethod.GET})
	public String insertCompl(ContributionDTO dto,HttpServletRequest request, HttpServletResponse response){
		
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //���ǿ��� �α���������������
		
		//ModelAndView mav = new ModelAndView();
		
		if(logInfo==null){                                              //�α����� �ʿ��� �������� ���־���� ������� null������ ���� ������
			
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum();//+"&message=" +"�α��κ�����!";
		}
		
		
		int numMax = dao.getMaxNum();
		
		dto.setConNum(numMax+1);
		dto.setGrecomm(0);                                  //0�� �������� �س��ƾ���
		System.out.println(dto.getUserId());
		int result = dao.checkComplContribution(dto);
		
		if(result>0){
			return "redirect:/checkContribution.action?gNum=" + dto.getgNum();//+"&message=�̹� ��õ�ϼ̽��ϴ�.";
		}
		
		dao.insertData(dto);
		compldao.updateRecomm(dto.getgNum());             //��� cpnum
		
		return "redirect:/checkContribution.action?gNum=" + dto.getgNum();//+"&message=";
	}
	
	@RequestMapping(value="/checkComplContribution.action",method={RequestMethod.GET,RequestMethod.POST})
	public String checkCompl(ContributionDTO dto,String message, HttpServletRequest request,HttpServletResponse response){

	//	System.out.println(dto.getgNum()+":::");
		int contribution = compldao.getRecomm(dto.getgNum());                  //��� cpNum
		request.setAttribute("contribution", contribution);
		request.setAttribute("message", message);

		return "board/contribution/contribution_update";
	}
}