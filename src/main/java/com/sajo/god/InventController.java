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

import com.sajo.dao.CommentDAO;
import com.sajo.dao.CompletedDAO;
import com.sajo.dao.GroupDAO;
import com.sajo.dao.ImageDAO;
import com.sajo.dao.InventDAO;
import com.sajo.dao.MemberDAO;
import com.sajo.dto.CompletedDTO;
import com.sajo.dto.GroupDTO;
import com.sajo.dto.InventDTO;
import com.sajo.util.MyUtil;

@Controller
public class InventController {
	
	@Autowired
	@Qualifier("groupDAO")
	GroupDAO dao;
	
	@Autowired
	@Qualifier("commentDAO")
	CommentDAO cdao;
	
	@Autowired
	@Qualifier("completedDAO")
	CompletedDAO cpdao;
	
	@Autowired
	@Qualifier("inventDAO")
	InventDAO indao;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO mdao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/inventList.action")
	public String imgList(String boardName,HttpServletRequest req,HttpServletResponse resp, HttpSession session){
		
		int gNum = Integer.parseInt(req.getParameter("gNum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		System.out.println(boardName+":"+gNum+":");
		
		int gno = indao.getGno(gNum);
		
		if(gno!=0){
			System.out.println(0);
			InventDTO dto1 = indao.getInventData(gno);
			if(dto1==null){
				String ImageoriginalFile1 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
				System.out.println(1);
			}else{
			String ImageoriginalFile1 = idao.getImage(dto1.getImgnum());
			req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
			System.out.println(2);
			}
			InventDTO dto2 = indao.get3dData(gno);
			if(dto2==null){
				String ImageoriginalFile2 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
				System.out.println(3);
			}else{
			String ImageoriginalFile2 =idao.getImage(dto2.getImgnum());
			req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
			System.out.println(4);
			}
			InventDTO dto3 = indao.getSketchData(gno);
			if(dto3==null){
				String ImageoriginalFile3 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
				System.out.println(5);
			}else{
			String ImageoriginalFile3 =idao.getImage(dto3.getImgnum());
			req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
			System.out.println(6);
			}
		}else{
				String ImageoriginalFile1 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
				String ImageoriginalFile2 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
				String ImageoriginalFile3 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
		}
		
		System.out.println(boardName+"::::"+gno);
		
		GroupDTO gdto = new GroupDTO();
		gdto = dao.g_getReadData(gno, boardName);
		
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("gNum", gNum);
		req.setAttribute("gNo", gno);
		req.setAttribute("boardName", boardName);
		req.setAttribute("gdto", gdto);
		
		
		return "invent";
	}
			
	@RequestMapping(value="/group/idea.action",method={RequestMethod.GET,RequestMethod.POST})
	public String i_list(GroupDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
		
		String boardName="idea";
		
		String pageNum = request.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = request.getParameter("searchKey");
		String searchValue = request.getParameter("searchValue");
		
		System.out.println(dto.getgNo());
		
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
		dataCount = indao.getDataCount(searchKey, searchValue,dto.getgNo(), boardName);
		
		
		int gNo = dto.getgNo();                                               //여러군데서 쓰기때문에 선언해줌

		
		//전체페이지수
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		System.out.println("idea : "+dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<GroupDTO> lists =
			indao.getList(start, end, searchKey, searchValue, dto.getgNo(),boardName);
		
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
		
		String listUrl = cp + "/group/idea.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/group/article.action?pageNum=" + currentPage + "&gNo=" + gNo;                      //dto. 쓰고난 뒤라서 getdto로가져오면 0이나옴.
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		System.out.println(dto.getgNo()+":idea article gNo");
		System.out.println(articleUrl+":ideaarticle");
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("boardName", boardName);

		request.setAttribute("dto", dto);

		request.setAttribute("gNo",gNo);


		
		return "board/list_idea";
	}
	
	@RequestMapping(value="/group/sketch.action",method={RequestMethod.GET,RequestMethod.POST})
	public String s_list(GroupDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
		
		String boardName="sketch";
		
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
		dataCount = indao.getDataCount(searchKey, searchValue,dto.getgNo(), boardName);
		
		int gNo = dto.getgNo();                     //중간에보냄
		
		//전체페이지수
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<GroupDTO> lists =
			indao.getList(start, end, searchKey, searchValue, dto.getgNo(),boardName);
		
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
		
		String listUrl = cp + "/group/sketch.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/group/article.action?pageNum=" + currentPage + "&gNo=" + gNo ;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("boardName", boardName);
		request.setAttribute("dto", dto);
		request.setAttribute("gNo",gNo);
		
		return "board/list_sketch";
	}
	
	@RequestMapping(value="/group/3D.action",method={RequestMethod.GET,RequestMethod.POST})
	public String md_list(GroupDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
		
		String boardName="3D";
		
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
		dataCount = indao.getDataCount(searchKey, searchValue,dto.getgNo(), boardName);
		
		int gNo = dto.getgNo();                     //중간에보냄
		
		
		//전체페이지수
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<GroupDTO> lists =
			indao.getList(start, end, searchKey, searchValue, dto.getgNo(), boardName);
		
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
		
		String listUrl = cp + "/group/3D.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
			myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		
		
		//글보기 주소 정리
		String articleUrl = 
			cp + "/group/article.action?pageNum=" + currentPage + "&gNo=" + gNo;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		
		
		//포워딩 될 페이지에 데이터를 넘긴다
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
		request.setAttribute("boardName", boardName);
		request.setAttribute("dto", dto);
		request.setAttribute("gNo",gNo);
		
		return "board/list_3d";
	}
	
	
	@RequestMapping(value="/contribute.action",method={RequestMethod.GET,RequestMethod.POST})
	public String contribute_ok(GroupDTO dto,HttpServletRequest request, HttpServletResponse response) throws Exception{
		return "";
	}

	
	
		

}

