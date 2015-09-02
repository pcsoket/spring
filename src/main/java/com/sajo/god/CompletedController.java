package com.sajo.god;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dao.CompletedDAO;
import com.sajo.dao.ImageDAO;
import com.sajo.dto.CompletedDTO;
import com.sajo.dto.GroupDTO;
import com.sajo.dto.ImageDTO;
import com.sajo.dto.LoginDTO;
import com.sajo.dto.ProductDTO;
import com.sajo.util.MyUtil;

@Controller
public class CompletedController {
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@Autowired
	@Qualifier("completedDAO")
	CompletedDAO cpdao;
	
	
	
	@RequestMapping(value="/compl/created.action")
	public ModelAndView compl_created(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
			ModelAndView mav = new ModelAndView();
			mav.setViewName("invent/created");
			
			return mav;
		
		
	}
	
	@RequestMapping(value="/compl/created_ok.action")
	public ModelAndView compl_created_ok(CompletedDTO cpdto,ImageDTO idto,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
		session = req.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		ModelAndView mav = new ModelAndView();
		
		String path = req.getSession().getServletContext().getRealPath("/resources/imageFile/"); //저장할 경로 지정 실제경로를 가져옴
		//null이 없는 imageDTO와 저장경로를 넣어주면 image테이블에 저장하고 저장한 이미지들의 넘버를 String으로 반환
		String imglistnum = idao.writeFile(idto, path);  //ex "3,4,5"반환
		
		
		cpdto.setCpNum(cpdao.cp_maxNum()+1); //product번호지정
		cpdto.setImgNum(imglistnum); //product 에서 뿌려줄 이미지들의 번호
		cpdto.setgNo(logInfo.getGno());
		cpdto.setMid(logInfo.getUserId());
		cpdao.p_insertData(cpdto);          //product 테이블에 insert
		mav.setViewName("redirect:/completed.action"); //?cpNum="+cpdto.getCpNum()); //나갈곳
		mav.addObject("cpdto",cpdto); //가져감?
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/completed.action")
	public String completed(CompletedDTO cpdto,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
		String cp = req.getContextPath();
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if(searchKey == null){
			
			searchKey = "cSubject";
			searchValue = "";
			
		}else{
			
			if(req.getMethod().equalsIgnoreCase("GET"))
				searchValue =
					URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//전체데이터갯수
		int dataCount = 0;
		dataCount = cpdao.cp_getDataCount();
		
		//전체페이지수
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		//System.out.println(start+":"+end+":"+searchKey+":"+searchValue+"::");
		List<CompletedDTO> lists =
			cpdao.cp_getList(start, end, searchKey, searchValue);
		
		lists = idao.imageForcList(lists);
		
		ListIterator<CompletedDTO> it = lists.listIterator();

		int listNum, n=0;

		while(it.hasNext()){
			
			cpdto = (CompletedDTO)it.next();
			listNum = dataCount - (start+n-1);
			cpdto.setListNum(listNum);
			n++;			
		}
		
		//페이징 처리
		String param = "";
		if(!searchValue.equals("")){
			param = "searchKey=" + searchKey;
			param+= "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/completed.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/compl/article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		
		//포워딩 될 페이지에 데이터를 넘긴다
		req.setAttribute("lists", lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("articleUrl",articleUrl);
		//req.setAttribute("boardName", boardName);
		
	
		
		List<CompletedDTO> belists = cpdao.getbest();
		
		belists = idao.imageForcList(belists);
		
		req.setAttribute("clists", belists);

		return "invent/completed";
	}
	
	@RequestMapping(value="/compl/article.action",method={RequestMethod.GET,RequestMethod.POST})
	//public String article(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
	public ModelAndView article (int cpNum,HttpServletResponse response,HttpServletRequest request) throws Exception{
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		ModelAndView mav = new ModelAndView();
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			
			mav.setViewName("login");
			mav.addObject("pagePath", "board/list");
			
			return mav;
		}

	
		String cp = request.getContextPath();
		
	//	System.out.println(gNum);
		//int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		if(searchKey != null)
			searchValue = URLDecoder.decode(searchValue, "UTF-8");
		
		//조회수 증가
		cpdao.updateHitCount(cpNum);
		
		CompletedDTO dto = cpdao.getReadData(cpNum);
		
		if(dto==null){
			//return new ModelAndView("redirect:list.action");
			String url = cp + "/completed.action";
			response.sendRedirect(url);
		}
		
		List<ImageDTO> ilists = idao.getImageList(dto.getImgNum());
		
		//String listimgnum = idao.getImage(dto.getImgNum());
		
		int lineSu = dto.getcContent().split("\n").length;
		
		dto.setcContent(dto.getcContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}		
			
		mav.setViewName("invent/complArticle");
		mav.addObject("ilists", ilists);
		mav.addObject("dto",dto);
		mav.addObject("params",param);
		mav.addObject("lineSu",lineSu);

		
		
		/*=======================================*/
		
		/*int numPerPage = 5;
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
		*/
		return mav;
		
	}

}
