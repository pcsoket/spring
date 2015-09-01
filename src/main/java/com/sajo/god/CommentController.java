package com.sajo.god;

import java.util.List;
import java.util.ListIterator;

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
		dto.setBoardName("test");
		dto.setCmNum(numMax+1);
		dao.insertData(dto);
		
		return "redirect:/comm/list.action?" + dto.getParams() + "&gNum=" + dto.getgNum();
	}

	@RequestMapping(value="/comm/list.action", method={RequestMethod.GET,RequestMethod.POST})
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
		System.out.println("list:"+ dto.getgNum());
		
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
		
		CommentDTO cdto = dao.getBestRecomm(dto.getgNum());
		System.out.println(dto.getgNum());
		//System.out.println(cdto.getCmId());

		
		request.setAttribute("cdto", cdto);
		request.setAttribute("c_lists", lists);
		request.setAttribute("c_totalDataCount", totalDataCount);
		request.setAttribute("c_pageIndexList", pageIndexList);
		request.setAttribute("c_pageNO", currentPage);

		return "board/commentList";

	}
	
	@RequestMapping(value="/comm/deleted.action", method={RequestMethod.GET,RequestMethod.POST})
	public String delete(CommentDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		dao.deleteData(dto.getCmNum());

		return "redirect:/comm/list.action?" + dto.getParams() + "&gNum=" + dto.getgNum();
	}
	
	@RequestMapping(value="/comm/updated_Recomm.action",method={RequestMethod.GET,RequestMethod.POST})

	public String updated_Recomm(CommentDTO dto, int cmNum, HttpServletRequest request,HttpServletResponse response) throws Exception{

	
			
		dao.update_recomm(cmNum);
		
		return "redirect:/comm/list.action?" + dto.getParams() + "&gNum=" + dto.getgNum();
		//return "redirect:/group/article.action?"+dto.getParams() + "&gNum=" + dto.getgNum();

		
	}
	
	
	/*@RequestMng updated(CommentDTO dto,int cmNum, HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String cp = request.getContextPath();
	apping(value="/comm/updated.action",method={RequestMethod.GET,RequestMethod.POST})
	public Stri
		String pageNum = request.getParameter("pageNum");
		
		dto = dao.getReadData(cmNum);
		
		if(dto == null){
			return "redirect:/comm/list.action?" + dto.getParams() + "&gNum=" + dto.getgNum();
		}
		
		request.setAttribute("dto", dto);
		request.setAttribute("pageNum", pageNum);
		
		return "board/c_updated";

	}*/
	
	/*@RequestMapping(value="/comm/updated_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated_ok(CommentDTO dto, HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		String pageNum = request.getParameter("pageNum");
		
		dao.updateData(dto);
		
		return "redirect:/group/article.action?"+"pageNum="+ pageNum +"&gNum=" + dto.getgNum();
			
	}*/

}