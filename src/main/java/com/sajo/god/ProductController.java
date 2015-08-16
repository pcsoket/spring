package com.sajo.god;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
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
		
		List<ProductDTO> categorylists = 
				dao.p_getListsCategory(start,end,pCategory);
		
		List<ProductDTO> hitcountlists = 
				dao.p_getListsHitCount(start,end);
		
		List<ProductDTO> ideahitcountlists = 
				dao.p_getListsIdeaHitCount(start,end,pCategory);


	
		
		
		
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
			pCategory = "아이디어상품";
		
		
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
		
		List<ProductDTO> categorylists = 
				dao.p_getListsCategory(start,end,pCategory);
		
		
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
		request.setAttribute("categorylists", categorylists);
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
		
		//==========================================================================이미지 insert
		
		String path = req.getSession().getServletContext().getRealPath("/resources/imageFile/");

		File dir = new File(path);
		if (!dir.exists()){
			dir.mkdirs();
		}

		MultipartFile file = req.getFile("upload");

		if (file != null && file.getSize() > 0) {

			try {
				String newFileName = null;

				newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newFileName += System.nanoTime();

				FileOutputStream ostream = new FileOutputStream(path + "/" + file.getOriginalFilename());

				InputStream istream = file.getInputStream();

				byte[] buffer = new byte[512];

				while (true) {

					int count = istream.read(buffer, 0, buffer.length);

					if (count == -1)
						break;

					ostream.write(buffer, 0, count);

				}

				istream.close();
				ostream.close();
				idto.setSaveFileName(newFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		//int maxNum = idao.getMaxNum();

		//idto.setImgNum(maxNum + 1);
		idto.setUploadFileName("product"); ///-----안씀
		idto.setOriginalFileName(file.getOriginalFilename());
		//idao.insertData(idto);
		//==========================================================================이미지 insert
		
		//pdto.setpNum(dao.p_maxNum()+1);
		pdto.setpCategory("product");     ///-------------임시로 카테고리지정
		
		mav.setViewName("shop_article");
		mav.addObject("pdto",pdto);
		
		return mav;
	}
}