package com.sajo.god;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dto.CommentDTO;
import com.sajo.dto.GroupDTO;
import com.sajo.util.MyUtil;
import com.sajo.dao.CommentDAO;
import com.sajo.dao.GroupDAO;

@Controller
public class GroupController {
	
	@Autowired
	@Qualifier("groupDAO")
	GroupDAO dao;
	
	@Autowired
	@Qualifier("commentDAO")
	CommentDAO cdao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="group/",method={RequestMethod.GET})
	public String home(){
		
		return "index";
		
	}
		
	@RequestMapping(value="/group/created.action")
	public ModelAndView created(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/created");
		
		return mav;
		
	}
	
	@RequestMapping(value="/group/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String created_ok(GroupDTO dto,HttpServletRequest request,HttpServletResponse response){
		
		int maxNum = dao.getMaxNum();
		System.out.println(dto.getgSubject());
		dto.setmId("흐흐흐");
		dto.setgNum(maxNum+1);
		dto.setgImg1("1");
		dto.setgImg2("1");
		dto.setgImg3("1");
		dto.setgImg4("1");
		dto.setBoardName("test");
		
		dao.insertData(dto);
		
		return "redirect:/group/list.action";
		
	}
	
	@RequestMapping(value="/group/list.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(GroupDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		
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
		int dataCount = 0;
		dataCount = dao.getDataCount(searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<GroupDTO> lists =
			dao.getList(start, end, searchKey, searchValue);
		
		ListIterator<GroupDTO> it = lists.listIterator();

		int listNum, n=0;

		while(it.hasNext()){
			
			dto = (GroupDTO)it.next();
			listNum = dataCount - (start+n-1);
			dto.setListNum(listNum);
			n++;			
		}
		
		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/group/list.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/group/article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "board/list";
		
	}
	
	@RequestMapping(value="/group/article.action",method={RequestMethod.GET,RequestMethod.POST})
	//public String article(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
	public ModelAndView article (int gNum, CommentDTO cdto,HttpServletResponse response,HttpServletRequest request) throws Exception{
	
		String cp = request.getContextPath();
		
		System.out.println(gNum);
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
			String url = cp + "/group/list.action";
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
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("board/article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("lineSu",lineSu);
		mav.addObject("pageNum",pageNum);
		
		
		/*=======================================*/
		
		int numPerPage = 5;
		int totalPage=0;
		int totalDataCount = 0;
	
		
		String pageNO = cdto.getPageNO();

		int currentPage = 1;
		
		if(pageNO  != null){
			currentPage = Integer.parseInt(cdto.getPageNO());
		}
		else
			pageNO="1";
	
		
		totalDataCount = cdao.getDataCount(dto.getgNum());
		
		
		//전체 페이지수 구하기
		if(totalDataCount!=0)
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);

		//삭제에 의해서 이럴 경우
		if(currentPage > totalPage){
			currentPage = totalPage;
		}

		int start = (currentPage-1)* numPerPage+1;
		int end = currentPage * numPerPage;


		List<CommentDTO> lists = cdao.getList(start, end, dto.getgNum());

		ListIterator<CommentDTO> it = lists.listIterator();

		int listNum, n=0;

		while(it.hasNext()){
			
			cdto = (CommentDTO)it.next();
			listNum = totalDataCount - (start+n-1);
			cdto.setListNum(listNum);
			cdto.setCmContent(cdto.getCmContent().replaceAll("\n", "<br/>"));
			n++;			

		}					
		
		String listUrl = cp + "/group/article.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param+"&gNum="+gNum;
		}
		
		String pageIndexList = myUtil.c_pageIndexList(currentPage, totalPage,listUrl);

		mav.addObject("lists", lists);
		mav.addObject("totalDataCount", totalDataCount);
		mav.addObject("pageIndexList", pageIndexList);
		mav.addObject("pageNO", currentPage);
		
		return mav;
		
	}
	
	@RequestMapping(value="/group/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(int gNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
	
		String pageNum = request.getParameter("pageNum");
		
		GroupDTO dto = dao.getReadData(gNum);
		
		if(dto == null){
			return "redirect:/group/list.action?pageNum=" + pageNum;
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		return "board/updated";

	}
	
	@RequestMapping(value="/group/updated_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated_ok(GroupDTO dto, HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String pageNum = request.getParameter("pageNum");
		
		dao.updateData(dto);
		
		return "redirect:/group/list.action?pageNum=" + pageNum;
		
	}
	
	@RequestMapping(value="/group/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(int gNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
				
		dao.deleteData(gNum);
		
		return "redirect:/group/list.action?pageNum=" + pageNum;
	
	}
}