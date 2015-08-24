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
		//pCategory�� null�Ͻ� ó��
		if(pCategory == null)
			pCategory = "���̵���ǰ";
		
		
		//��ü�����Ͱ���
		int dataCount = dao.p_getDataCount(searchKey, searchValue);
		
		//��ü��������
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
				dao.p_getListsIdeaHitCount(start,end,"���̵��");
		
		//ù��° �̹����� ��� �־���.
		lists = idao.imageForList(lists);
		categorylists = idao.imageForList(categorylists);
		hitcountlists = idao.imageForList(hitcountlists);
		ideahitcountlists = idao.imageForList(ideahitcountlists);


		//����¡ ó��
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
		
		//�ۺ��� �ּ� ����
		String articleUrl = 
			cp + "/shop_article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//
		
		//������ �� �������� �����͸� �ѱ��
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
		//pCategory�� null�Ͻ� ó��
		if(pCategory == null)
			pCategory = "%%";
		
		
		//��ü�����Ͱ���
		int dataCount = dao.p_getDataCount(searchKey, searchValue);
		
		System.out.println(dataCount);
		//��ü��������
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		pCategory = "��ǿ�ǰ";
		
		List<ProductDTO> idea_hitcountlists = 
				dao.p_getListsIdea_HitCount(start,end,pCategory);

		
		//ù��° �̹����� ��� �־���.
		idea_hitcountlists = idao.imageForList(idea_hitcountlists);
	
		
		
		
		//����¡ ó��
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
		
		//�ۺ��� �ּ� ����
		String articleUrl = 
			cp + "/shop_article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//������ �� �������� �����͸� �ѱ��
		
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
		
		//��ȸ�� ����
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
	
	@RequestMapping(value="/shop_update.action",method={RequestMethod.GET,RequestMethod.POST})  ///����� ����.
	
	public ModelAndView shop_update (ProductDTO dto, HttpServletResponse response,HttpServletRequest request) throws Exception{
	
	///����� ����.
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		dto = dao.p_getReadData(dto.getpNum());    //�Ѿ�� pnum���� dto�о��.
		
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
		
		String path = req.getSession().getServletContext().getRealPath("/resources/imageFile/"); //������ ��� ����
		//null�� ���� imageDTO�� �����θ� �־��ָ� image���̺� �����ϰ� ������ �̹������� �ѹ��� String���� ��ȯ
		String imglistnum = idao.writeFile(idto, path);  //ex "3,4,5"��ȯ
		
		
		System.out.println(imglistnum);
		
		pdto.setpNum(dao.p_maxNum()+1); //product��ȣ����
		pdto.setpImg(imglistnum);        //product ���� �ѷ��� �̹������� ��ȣ
		dao.p_insertData(pdto);          //product ���̺� insert
		mav.setViewName("redirect:shop_article.action?pNum="+pdto.getpNum()); //������
		//mav.addObject("pdto",pdto); ������?
		
		return mav;
		
	}
	
}