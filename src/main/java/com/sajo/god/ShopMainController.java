package com.sajo.god;

import java.io.File;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.sajo.dao.BasketDAO;
/*import com.sajo.dao.BasketDAO;
import com.sajo.dto.BasketDTO;*/
import com.sajo.util.MyUtil;


@Controller
public class ShopMainController {
	
	@Autowired
	@Qualifier("basketDAO") //중복방지
	BasketDAO dao;

	@Autowired
	MyUtil myUtil;

	
	@RequestMapping(value="/shopmain.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req, String data) throws Exception{
		
		
				
		return "shopmain";
	}
	
	@RequestMapping(value="/basket.action")
	public String basket(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		int pnum = 12;
		
		String savePath = "example" + File.separator + "resources" + File.separator + "imageFile";
		
		String cp = request.getContextPath();
		
		//int dataCount = dao.getDataCount();
		
		//List<BasketDTO> lists = (List<BasketDTO>)dao.readPro(pnum);
		
		
		
		//String urlList = cp + "/img/list.action";
		
		String imageUrl = "/example/resources/imageFile";
		
		request.setAttribute("savePath", savePath);
		request.setAttribute("imageUrl", imageUrl);
		//request.setAttribute("bklists", lists);
		//request.setAttribute("dataCount", dataCount);
		
		//System.out.println(dataCount);

		
		return "basket";
	}
	
	/*@RequestMapping(value="/myPage.action")
	public String myPage(){
		
		
		return "shopMyPage";
	}*/
	
/*	@RequestMapping(value="/orderList.action")             테스트중
	public String orderList(){
		
		
		return "shopOrderList";
	}*/
	
	@RequestMapping(value="/cancel.action")
	public String orderCancel(){
		
		
		return "shopordercancel";
	}
	
	
}
