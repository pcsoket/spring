package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sajo.util.MyUtil;
import com.sajo.dao.CommentDAO;
import com.sajo.dto.CommentDTO;


@Controller
public class CommentController {
	
	@Autowired
	@Qualifier("commentDAO") //중복방지
	CommentDAO dao;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value="/comm/created.action", method={RequestMethod.POST,RequestMethod.GET})
	public String created(CommentDTO dto,HttpServletRequest request, HttpServletResponse response){
		
		int numMax = dao.getMaxNum();
		
	/*	 CMNUM                                     NOT NULL NUMBER                      
		 GNO                                       NOT NULL NUMBER                      
		 GNUM                                               NUMBER                      
		 CMID                                      NOT NULL VARCHAR2(12)                
		 CMRECOMM                                           NUMBER                      
		 CMCONTENT                                 NOT NULL VARCHAR2(400)               
		 CMCREATED                                 NOT NULL DATE                        
		 BOARDNAME                                 NOT NULL VARCHAR2(10) */
	
		dto.setCmNum(numMax+1);
		dao.insertData(dto);

		return "redirect:/group/article.action?"+dto.getParams()+"&gNum=" + dto.getgNum();
	}

	/*@RequestMapping(value="/comm/list.action", method={RequestMethod.GET,RequestMethod.POST})
	public String list(CommentDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
				
		int numPerPage = 5;
		int totalPage=0;
		int totalDataCount = 0;
	
		String pageNO = request.getParameter("pageNO");
	

		int currentPage = 1;
		
		if(pageNO  != null){
			currentPage = Integer.parseInt(pageNO);
		}
		else
			pageNO="1";
	
		
		totalDataCount = dao.getDataCount(dto.getgNum());
		
		
		//전체 페이지수 구하기
		if(totalDataCount!=0)
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);

		//삭제에 의해서 이럴 경우
		if(currentPage > totalPage){
			currentPage = totalPage;
		}

		int start = (currentPage-1)* numPerPage+1;
		int end = currentPage * numPerPage;


		List<CommentDTO> lists = dao.getList(start, end, dto.getgNum());

		ListIterator<CommentDTO> it = lists.listIterator();

		int listNum, n=0;

		while(it.hasNext()){
			
			dto = (CommentDTO)it.next();
			listNum = totalDataCount - (start+n-1);
			dto.setListNum(listNum);
			dto.setCmContent(dto.getCmContent().replaceAll("\n", "<br/>"));
			n++;			

		}					
		
		String pageIndexList = myUtil.pageIndexList(currentPage, totalPage);

		request.setAttribute("lists", lists);
		request.setAttribute("totalDataCount", totalDataCount);
		request.setAttribute("pageIndexList", pageIndexList);
		request.setAttribute("pageNO", currentPage);

		return "comm/commList";

	}*/
	
	@RequestMapping(value="/comm/deleted.action", method={RequestMethod.GET,RequestMethod.POST})
	public String delete(CommentDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		dao.deleteData(dto.getCmNum());

		return "redirect:/group/article.action?"+dto.getParams()+"&gNum=" + dto.getgNum();
	}
	
	@RequestMapping(value="/comm/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(int cmNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
	
		String pageNum = request.getParameter("pageNum");
		
		CommentDTO dto = dao.getReadData(cmNum);
		
		if(dto == null){
			return "redirect:/group/article.action?"+dto.getParams()+"&gNum=" + dto.getgNum();
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		return "comm/updated";

	}
	
	@RequestMapping(value="/comm/updated_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated_ok(CommentDTO dto, HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String pageNum = request.getParameter("pageNum");
		
		dao.updateData(dto);
		
		return "redirect:/group/article.action?"+dto.getParams()+"&gNum=" + dto.getgNum();
		
	}

}