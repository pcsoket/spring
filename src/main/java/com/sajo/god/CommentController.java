package com.sajo.god;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;


import com.sajo.dto.GroupDTO;
import com.sajo.util.MyUtil;
import com.sajo.dao.GroupDAO;

@Controller
public class CommentController {
	
	@Autowired
	@Qualifier("groupDAO")
	GroupDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="comment/",method={RequestMethod.GET})
	public String home(){
		
		return "index";
		
	}
	
	/*@RequestMapping(value="comment/created.action",method={RequestMethod.GET,RequestMethod.POST})
	public String created(HttpServletRequest request,HttpServletResponse response){
		
		return "created";
		
	}*/
	
	@RequestMapping(value="/comment/created.action")
	public ModelAndView created(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("created");
		
		return mav;
		
	}
	
	@RequestMapping(value="/comment/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String created_ok(GroupDTO dto,HttpServletRequest request,HttpServletResponse response){
		
		int maxNum = dao.getMaxNum();
		System.out.println(dto.getgSubject());
		dto.setmId("1");
		dto.setgNum(maxNum+1);
		dto.setgImg1("1");
		dto.setgImg2("1");
		dto.setgImg3("1");
		dto.setgImg4("1");
		dto.setBoardName("test");
		
		dao.insertData(dto);
		
		return "redirect:/comment/list.action";
		
	}
	
	@RequestMapping(value="/comment/list.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey == null){
			
			searchKey = "gSubject";
			searchValue = "";
			
		}else{
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
					URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = dao.getDataCount(searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<GroupDTO> lists =
			dao.getList(start, end, searchKey, searchValue);
		
		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/comment/list.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/comment/article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "list";
		
	}
	
	@RequestMapping(value="/comment/article.action",method={RequestMethod.GET,RequestMethod.POST})
	//public String article(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
	public ModelAndView article (int gNum, HttpServletResponse response,HttpServletRequest request) throws Exception{
	
		String cp = request.getContextPath();
		
		//int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		//조회수 증가
		dao.updateHitCount(gNum);
		
		GroupDTO dto = dao.getReadData(gNum);
		
		if(dto==null){
			//return new ModelAndView("redirect:list.action");
			String url = cp + "/comment/list.action";
			response.sendRedirect(url);
		}
		
		int lineSu = dto.getgContent().split("\n").length;
		
		dto.setgContent(dto.getgContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		/*request.setAttribute("dto", dto);
		request.setAttribute("params",param);
		request.setAttribute("lineSu",lineSu);
		request.setAttribute("pageNum",pageNum);
		
		return "article";*/
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("lineSu",lineSu);
		mav.addObject("pageNum",pageNum);
		
		return mav;
		
	}
	
	@RequestMapping(value="/comment/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(Integer num, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
	
	//	int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		GroupDTO dto = dao.getReadData(num);
		
		if(dto == null){/*
			String url = cp + "/list.action";
			response.sendRedirect(url);*/
			return "redirect:/comment/list.action?pageNum=" + pageNum;
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		return "updated";

	}
	
	@RequestMapping(value="/comment/updated_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated_ok(GroupDTO dto, HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String pageNum = request.getParameter("pageNum");
		
		/*GroupDTO dto = new GroupDTO();
		
		dto.setNum(Integer.parseInt(request.getParameter("num")));
		dto.setSubject(request.getParameter("subject"));
		dto.setName(request.getParameter("name"));
		dto.setEmail(request.getParameter("email"));
		dto.setPwd(request.getParameter("pwd"));
		dto.setContent(request.getParameter("content"));
		*/
		dao.updateData(dto);
		
		return "redirect:/comment/list.action?pageNum=" + pageNum;
		
	}
	
	@RequestMapping(value="/comment/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(Integer num, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
		//int num =Integer.parseInt(request.getParameter("num"));
		
		dao.deleteData(num);
		
		return "redirect:/comment/list.action?pageNum=" + pageNum;
	
	}
}