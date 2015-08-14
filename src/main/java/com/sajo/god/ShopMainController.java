package com.sajo.god;

import java.io.File;
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

import com.sajo.dao.BasketDAO;
import com.sajo.dao.MemberDAO;
import com.sajo.dto.BasketDTO;
import com.sajo.dto.MemberDTO;
import com.sajo.util.MyUtil;


@Controller
public class ShopMainController {
	
	@Autowired
	@Qualifier("basketDAO") //중복방지
	BasketDAO dao;
	
	@Autowired
	MemberDAO mdao;

	@Autowired
	MyUtil myUtil;

	
	@RequestMapping(value="/shopmain.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req, String data) throws Exception{
		
		
				
		return "shop";
	}
	
	@RequestMapping(value="/basket.action")
	public String basket(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		String userId = "3";
		
		String savePath = "example" + File.separator + "resources" + File.separator + "imageFile";
		
		String cp = request.getContextPath();
		
		int dataCount = dao.getDataCount(userId);
		
		List<BasketDTO> lists = (List<BasketDTO>)dao.readPro(userId);
		
		
		
		//String urlList = cp + "/img/list.action";
		
		String imageUrl = "/example/resources/imageFile";
		
		request.setAttribute("savePath", savePath);
		request.setAttribute("imageUrl", imageUrl);
		request.setAttribute("bklists", lists);
		request.setAttribute("dataCount", dataCount);
		

		
		return "basket";
	}
	
/*	@RequestMapping(value="/orderList.action")             테스트중
	public String orderList(){
		
		
		return "shopOrderList";
	}*/
	
	@RequestMapping(value="/cancel.action")
	public String orderCancel(){
		
		
		
		return "shopordercancel";
	}
	
	@RequestMapping(value="/direct.action")
	public String direct(Integer bnum, Integer amount,HttpServletRequest req, HttpServletResponse resp,HttpSession session){
		
		String id = (String)session.getAttribute("userId");
		
		MemberDTO mdto = mdao.getReadData("3");
		
		System.out.println(mdto.getUserName());
		
		BasketDTO dto = dao.readbasket(bnum);
		
		int total = dto.getbPrice() * amount;
						
		req.setAttribute("dto", dto);
		req.setAttribute("amount", amount);
		req.setAttribute("total", total);
		req.setAttribute("mdto", mdto);
		
		return "purchase";
	}
	
	@RequestMapping(value="/purchase.action")
	public String purchase(Integer bnum,HttpServletRequest req, HttpServletResponse resp){
		
			
		
		return "redirect:basket.action";
	}
	
	@RequestMapping(value="/del.action")
	public String del(Integer bnum,HttpServletRequest req, HttpServletResponse resp){
		
		dao.delbasket(bnum);
				
		
		
		return "redirect:basket.action";
	}
	
}
