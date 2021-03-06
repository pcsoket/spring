package com.sajo.god;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sajo.dao.ReportDAO;
import com.sajo.dto.LoginDTO;
import com.sajo.dto.ReportDTO;
import com.sajo.util.MyUtil;

@Controller
public class ReportController {

	@Autowired
	@Qualifier("reportDAO")
	ReportDAO rpdao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/report.action")
	public String report (HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		
		LoginDTO dto = (LoginDTO)session.getAttribute("logInfo");
		
		//String mid=dto.getUserId();
		
		String rContent = req.getParameter("rContent");
		
		req.setAttribute("rContent", rContent);
		req.setAttribute("mid",dto.getUserId());
		return "reportArticle";
		
	}
	
	@RequestMapping(value="/report_ok.action")
	public void report_ok (HttpServletRequest req, ReportDTO dto, HttpServletResponse resp, HttpSession session){
		
		LoginDTO ldto = (LoginDTO)session.getAttribute("logInfo");

		dto.setBoardName(req.getParameter("boardName"));
		dto.setRnum(rpdao.getMaxNum()+1);
		dto.setGnum(Integer.parseInt(req.getParameter("gnum")));
		dto.setMid(ldto.getUserId());
		dto.setrContent(req.getParameter("rContent"));
		
		rpdao.insertData(dto);
		
	}
	
	@RequestMapping(value="/reportlist.action")
	public String list (HttpServletRequest req, ReportDTO dto, HttpServletResponse resp, HttpSession session){
		
		String cp = req.getContextPath();
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		//전체데이터갯수
		int dataCount = rpdao.getDataCount();
		
		//전체페이지수
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<ReportDTO> lists = rpdao.getReadData(start,end);
		
		String listUrl = cp + "/reportlist.action";
		
		String pageIndexList =
				myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		req.setAttribute("lists", lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		
		return "reportList";
		
	}
	
	@RequestMapping(value="/reportdelete.action")
	public String reportdelete (HttpServletRequest req, HttpServletResponse resp, HttpSession session){
		
		int rnum = Integer.parseInt(req.getParameter("rnum"));
		
		rpdao.deleteData(rnum);
		
		return "redirect:/reportlist.action";
		
	}
	
}
