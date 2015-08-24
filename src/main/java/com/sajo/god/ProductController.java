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
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dao.ImageDAO;
import com.sajo.dao.ProductDAO;
import com.sajo.dto.ImageDTO;
import com.sajo.dto.ProductDTO;
import com.sajo.util.MyUtil;

@Controller
public class ProductController {
	
	@Autowired
	@Qualifier("productDAO")
	ProductDAO dao;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;

	@Autowired
	MyUtil myUtil;
	
	
	@RequestMapping(value="/category.action",method={RequestMethod.GET,RequestMethod.POST})
	public String category(String pCategory,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
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
		//pCategory가 null일시 처리
		if(pCategory == null)
			pCategory = "아이디어상품";
		
		
		//전체데이터갯수
		int dataCount = dao.p_getDataCount(searchKey, searchValue);
		
		//전체페이지수
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<ProductDTO> lists =
			dao.p_getList(start, end, searchKey, searchValue);
		
		List<ProductDTO> categorylists = 
				dao.p_getListsCategory(start,end,pCategory);
		
		List<ProductDTO> hitcountlists = 
				dao.p_getListsHitCount(start,end);
		
		List<ProductDTO> recommandlists = 
				dao.p_getListsHitCount(start,end);
		
		List<ProductDTO> ideahitcountlists = 
				dao.p_getListsIdeaHitCount(start,end,"아이디어");
		
		//첫번째 이미지만 골라서 넣어줌.
		lists = idao.imageForList(lists);
		categorylists = idao.imageForList(categorylists);
		hitcountlists = idao.imageForList(hitcountlists);
		ideahitcountlists = idao.imageForList(ideahitcountlists);


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
		
		//
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("recommandlists", recommandlists);
		request.setAttribute("categorylists", categorylists);
		request.setAttribute("hitcountlists", hitcountlists);
		request.setAttribute("ideahitcountlists", ideahitcountlists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		
		return "category";		
		
	}
	
	@RequestMapping(value="/idea_category.action",method={RequestMethod.GET,RequestMethod.POST})
	public String idea_category(String pCategory,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
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
		//pCategory가 null일시 처리
		if(pCategory == null)
			pCategory = "%%";
		
		
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
		
		pCategory = "욕실용품";
		
		List<ProductDTO> idea_hitcountlists = 
				dao.p_getListsIdea_HitCount(start,end,pCategory);

		
		//첫번째 이미지만 골라서 넣어줌.
		idea_hitcountlists = idao.imageForList(idea_hitcountlists);
	
		
		
		
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
		
		request.setAttribute("idea_hitcountlists", idea_hitcountlists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		
		return "idea_category";		
		
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
		List<ImageDTO> ilists = idao.getImageList(dto.getpImg());
		
		int lineSu = dto.getpContent().split("\n").length;
		
		dto.setpContent(dto.getpContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
				
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("shop_article");
		
		mav.addObject("ilists",ilists);
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("lineSu",lineSu);
		mav.addObject("pageNum",pageNum);
		
		return mav;
		
	}
	
	@RequestMapping(value="/shop_update.action",method={RequestMethod.GET,RequestMethod.POST})  ///만들다 말음.
	
	public ModelAndView shop_update (ProductDTO dto, HttpServletResponse response,HttpServletRequest request) throws Exception{
	
	///만들다 말음.
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		dto = dao.p_getReadData(dto.getpNum());    //넘어온 pnum으로 dto읽어옴.
		
		if(dto==null){
			
			String url = cp + "/category.action";
			response.sendRedirect(url);
		}
		
		List<ImageDTO> ilists = idao.getImageList(dto.getpImg());
		
		
		int lineSu = dto.getpContent().split("\n").length;
		
		dto.setpContent(dto.getpContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
				
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("productUpdate");
		
		mav.addObject("ilists",ilists);
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("lineSu",lineSu);
		mav.addObject("pageNum",pageNum);
		
		return mav;
		
	}
	
	// ============================================================= productcreated
	@RequestMapping(value="/shop_created.action",method={RequestMethod.GET,RequestMethod.POST})
	
	public ModelAndView shop_created (HttpServletResponse response,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		mav.setViewName("productWrite");
		
		return mav;
	}

	@RequestMapping(value="/shop_created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public ModelAndView shop_created_ok (ProductDTO pdto,ImageDTO idto, MultipartHttpServletRequest req, HttpServletResponse response,HttpServletRequest request) throws Exception{
		ModelAndView mav = new ModelAndView();
		
		String path = req.getSession().getServletContext().getRealPath("/resources/imageFile/"); //저장할 경로 지정
		//null이 없는 imageDTO와 저장경로를 넣어주면 image테이블에 저장하고 저장한 이미지들의 넘버를 String으로 반환
		String imglistnum = idao.writeFile(idto, path);  //ex "3,4,5"반환
		
		
		System.out.println(imglistnum);
		
		pdto.setpNum(dao.p_maxNum()+1); //product번호지정
		pdto.setpImg(imglistnum);        //product 에서 뿌려줄 이미지들의 번호
		dao.p_insertData(pdto);          //product 테이블에 insert
		mav.setViewName("redirect:shop_article.action?pNum="+pdto.getpNum()); //나갈곳
		//mav.addObject("pdto",pdto); 가져감?
		
		return mav;
		
	}
	
}