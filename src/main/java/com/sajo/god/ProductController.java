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

import com.sajo.dao.ProductDAO;
import com.sajo.dto.ProductDTO;
import com.sajo.util.MyUtil;

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("ProductDAO")
	ProductDAO dao;

	@Autowired
	MyUtil myUtil;
	
	/*@RequestMapping("/created.action")
	public ModelAndView created(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("group/created");
		
		return mav;
		
	}
	
	@RequestMapping(value="/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String created_ok(GroupDTO dto,HttpServletRequest request,HttpServletResponse response){
		
		int maxNum = dao.getMaxNum();
		
		dto.setgNum(maxNum+1);
				
		dto.setgNo(1);		
		dto.setuserId("3");
		dto.setgImg1("4");
		dto.setgImg2("5");
		dto.setgImg3("6");
		dto.setgImg4("7");
		dto.setBoardName("8");
		
		dao.insertData(dto);
		
		return "redirect:list.action";
		
	}*/
	
	@RequestMapping(value="/category.action",method={RequestMethod.GET,RequestMethod.POST})
	public String category(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey == null){
			
			searchKey = "pName";
			searchValue = "";
						
		}else{
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
					URLDecoder.decode(searchValue, "UTF-8");
			
		}
		//전체데이터갯수
		int dataCount = dao.p_getDataCount(searchKey, searchValue);
		
		System.out.println(dataCount);
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<ProductDTO> lists =
			dao.p_getList(start, end, searchKey, searchValue);
		
		System.out.println(lists.size());
		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/category.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/shop_article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "category";		
		
	}
	
	@RequestMapping(value="/shop_article.action",method={RequestMethod.GET,RequestMethod.POST})
	
	public ModelAndView shop_article (Integer pNum, HttpServletResponse response,HttpServletRequest request) throws Exception{
	
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		//조회수 증가
		dao.p_updateHitCount(pNum);
		
		ProductDTO dto = dao.p_getReadData(pNum);
		
		if(dto==null){
			
			String url = cp + "/category.action";
			response.sendRedirect(url);
		}
		

		
		
		
		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
				
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("shop_article");
		
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("pageNum",pageNum);
		
		return mav;
		
	}
	
	
	
	/*
	@RequestMapping(value="/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(Integer gNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
	
		String pageNum = request.getParameter("pageNum");
		
		GroupDTO dto = dao.getReadData(gNum);
		
		if(dto == null){
			
			return "redirect:list.action?pageNum=" + pageNum;
			
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		return "group/updated";

	}
	
	@RequestMapping(value="/updated_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated_ok(GroupDTO dto, HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String pageNum = request.getParameter("pageNum");
		
		dao.updateData(dto);
		
		return "redirect:list.action?pageNum=" + pageNum;
		
	}
	
	@RequestMapping(value="/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(Integer gNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
				
		dao.deleteData(gNum);
		
		return "redirect:list.action?pageNum=" + pageNum;
		
	}*/

}