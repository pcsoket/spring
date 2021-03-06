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

import com.sajo.dto.ContributionDTO;
//import com.sajo.dto.CommentDTO;
import com.sajo.dto.GroupDTO;
import com.sajo.dto.ImageDTO;
import com.sajo.dto.LoginDTO;
import com.sajo.util.MyUtil;
import com.sajo.dao.CommentDAO;
import com.sajo.dao.ContributionDAO;
//import com.sajo.dao.CompletedDAO;
import com.sajo.dao.GroupDAO;
import com.sajo.dao.ImageDAO;
import com.sajo.dao.MemberDAO;

@Controller
public class GroupController {
	
	@Autowired
	@Qualifier("groupDAO")
	GroupDAO dao;
	
	@Autowired
	@Qualifier("commentDAO")
	CommentDAO cdao;

	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@Autowired
	@Qualifier("contributionDAO")
	ContributionDAO condao;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO mdao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="group/",method={RequestMethod.GET})
	public String home(){
		
		return "index";
		
	}
		
	@RequestMapping(value="/group/created.action")
	public ModelAndView created(String boardName,HttpServletRequest request){
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		ModelAndView mav = new ModelAndView();
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			mav.setViewName("login");
			mav.addObject("pagePath","ideamain");
			return mav;
		}
		
	//	System.out.println(boardName);
		
		mav.setViewName("board/created");
		mav.addObject("boardName", boardName);
		
		return mav;
		
	}
	
	@RequestMapping(value="/group/created_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String created_ok(String boardName,GroupDTO dto,ImageDTO idto,HttpServletRequest request,HttpServletResponse response){
		
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			request.setAttribute("pagePath", "redirect:/group/list.action");
			return "login";
		}
		
		String path = request.getSession().getServletContext().getRealPath("/resources/imageFile/"); //저장할 경로 지정 실제경로를 가져옴
		//null이 없는 imageDTO와 저장경로를 넣어주면 image테이블에 저장하고 저장한 이미지들의 넘버를 String으로 반환
		String imgNum = idao.writeFile(idto, path);  //ex "3,4,5"반환
	
	//	System.out.println(dto.getgContent());
		int maxNum = dao.getMaxNum();
		int gnoMaxNum = dao.getGnoMaxNum();
		//System.out.println(dto.getgSubject());
		dto.setmId(logInfo.getUserId());
		dto.setgNum(maxNum+1);
		System.out.println("gno" + logInfo.getGno());
		
		
		if(logInfo.getGno() != 0){	
			
			dto.setgNo(logInfo.getGno());
			
		}else{
			
			dto.setgNo(gnoMaxNum + 1);
		//	System.out.println("list : "+dto.getgNo());
			mdao.gnoUpdate(dto.getgNo(), logInfo.getUserId());
			session.setAttribute("logInfo", logInfo);
			
		}
		dto.setImgNum(imgNum);  // 이미지테이블에서 가져올 이미지들의 넘버
		
		
		//글씀과 동시에 점수 를 얻음.
		ContributionDTO condto = new ContributionDTO();
		condto.setConNum(condao.getMaxNum()+1);
		condto.setBoardName(boardName);
		condto.setgNo(dto.getgNo());
		condto.setgNum(dto.getgNum());
		condto.setUserId(dto.getmId());
		condto.setGrecomm(1);                      //점수조절
		condto.setWriter(dto.getmId());
		condao.insertData(condto);
		
		
		
	
		
		if(boardName.equals("group")){
			dto.setBoardName("group");                 // group,idea,3d,sketch
			
			dao.insertData(dto);
			
			return "redirect:/group/list.action";
			
		}else if(boardName.equals("idea")){
			
			dto.setBoardName(boardName);
			
			dao.insertData(dto);
			
			request.setAttribute("dto", dto);
			
			return "redirect:/group/idea.action?gNo=" + dto.getgNo() + "&boardName=" + dto.getBoardName();
		
		}else if(boardName.equals("sketch")){
			
			dto.setBoardName(boardName);
			
			dao.insertData(dto);
			
			request.setAttribute("dto", dto);
			
			return "redirect:/group/sketch.action?gNo=" + dto.getgNo() + "&boardName=" + dto.getBoardName();
			
			
		}else{
			
			dto.setBoardName(boardName);
			
			dao.insertData(dto);
			
			request.setAttribute("dto", dto);
			
			return "redirect:/group/3D.action?gNo=" + dto.getgNo() + "&boardName=" + dto.getBoardName();
			
		}
		
		
	}
	
	@RequestMapping(value="/group/list.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(GroupDTO dto,HttpServletRequest request,HttpServletResponse response) throws Exception{
			
		String cp = request.getContextPath();
		
		String boardName = "group";
		
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
	//	System.out.println(start+":"+end+":"+searchKey+":"+searchValue+":"+boardName);
		List<GroupDTO> lists =
			dao.getList(start, end, searchKey, searchValue,boardName);
		
		lists = idao.imageForGList(lists);
		
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
			cp + "/inventList.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("boardName", boardName);
		
		return "board/list";
		
	}
	
	@RequestMapping(value="/group/article.action",method={RequestMethod.GET,RequestMethod.POST})
	//public String article(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
	public ModelAndView article (int gNum,HttpServletResponse response,HttpServletRequest request) throws Exception{
		
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
		dao.updateHitCount(gNum);
		
		GroupDTO dto = dao.getReadData(gNum);
		
		if(dto==null){
			//return new ModelAndView("redirect:list.action");
			String url = cp + "/group/list.action";
			response.sendRedirect(url);
		}
		
		List<ImageDTO> ilists = idao.getImageList(dto.getImgNum());
		
		//String listimgnum = idao.getImage(dto.getImgNum());
		
		int lineSu = dto.getgContent().split("\n").length;
		
		dto.setgContent(dto.getgContent().replaceAll("\n", "<br/>"));
		
		String param = "pageNum=" + pageNum;
		if(searchKey!=null){
			param += "&searchKey=" + searchKey;
			param += "&searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}		
			
		mav.setViewName("board/ideaArticle");
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
	
	@RequestMapping(value="/group/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(int gNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		//String cp = request.getContextPath();
	
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
	
	@RequestMapping(value="/gnoattend.action",method={RequestMethod.GET,RequestMethod.POST})
	public String gnoattend(int gNo,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo"); 
		String userId = logInfo.getUserId();
		
		mdao.updategno(gNo, userId);
		
		
		return "redirect:/board/article.action";
	}
	
	@RequestMapping(value="/group/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(int gNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String pageNum = request.getParameter("pageNum");
				
		dao.deleteData(gNum);
		
		return "redirect:/group/list.action?pageNum=" + pageNum;
	
	}
}