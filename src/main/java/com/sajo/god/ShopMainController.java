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
import com.sajo.dao.PurchaseDAO;
import com.sajo.dto.BasketDTO;
import com.sajo.dto.MemberDTO;
import com.sajo.dto.PurchaseDTO;
import com.sajo.util.MyUtil;


@Controller
public class ShopMainController {
	
	@Autowired
	@Qualifier("basketDAO") //중복방지
	BasketDAO dao;
	
	@Autowired
	MemberDAO mdao;
	
	@Autowired
	PurchaseDAO pdao;

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
		
		//System.out.println(mdto.getUserName());
		
		BasketDTO dto = dao.readbasket(bnum);
		
		int total = dto.getbPrice() * amount;
						
		req.setAttribute("dto", dto);
		req.setAttribute("amount", amount);
		req.setAttribute("total", total);
		req.setAttribute("mdto", mdto);
		
		return "purchase";
	}
	
	@RequestMapping(value="/basket_ok.action")
	public String basket_ok(String bnums, String amt,HttpServletRequest req, HttpServletResponse resp,HttpSession session){
		
		String id = (String)session.getAttribute("userId");
		
		MemberDTO mdto = mdao.getReadData(id);
		
		if(bnums != null){
			
			String[] nums= bnums.split("-");
			String[] amts= amt.split("-");
			
			PurchaseDTO pdto;
			for(int i=0;i<nums.length;i++){
				
				BasketDTO dto = dao.readbasket(Integer.parseInt(nums[i]));
				
				
				pdto = new PurchaseDTO();
				
				pdto.setBnum(dto.getbNum());
				pdto.setPamount(Integer.parseInt(amts[i]));
				pdto.setPname(dto.getbPName());
				pdto.setPprice(Integer.parseInt(amts[i])* dto.getbPrice());
				pdto.setMid(id);
				pdto.setMaddr(mdto.getUserAddr2());
				pdto.setBdate("");
				pdto.setState("결제전");
				pdto.setRetake(0);
				pdto.setPnum(dto.getpNum());
				
				pdao.insertData(pdto);
				
				if (pdto!=null) {
						
						pdao.deleteData(Integer.parseInt(nums[i]));
						
					}
					
			}
			
			req.setAttribute("pdto", pdto);
			
			
			
		}else{
			
			BasketDTO dto = dao.readbasket(Integer.parseInt(bnums));
			
			PurchaseDTO pdto = new PurchaseDTO();
			
			
			pdto.setBnum(dto.getbNum());
			pdto.setPamount(dto.getbAmount());
			pdto.setPname(dto.getbPName());
			pdto.setPprice(dto.getbPrice());
			pdto.setMid(id);
			pdto.setMaddr(mdto.getUserAddr2());
			pdto.setBdate("");
			pdto.setState("결제전");
			pdto.setRetake(0);
			pdto.setPnum(dto.getpNum());
			
			pdao.insertData(pdto);
			
		}
		
		
		req.setAttribute("mdto", mdto);
		
		
		return "redirect:purchase.action";
	}
	
	@RequestMapping(value="/purchase.action")
	public String purchase(Integer bnum,HttpServletRequest req, HttpServletResponse resp){
	
	
		
		return "purchase";
	}
	
	
	
	@RequestMapping(value="/card.action")
	public String card(Integer bnum,HttpServletRequest req, HttpServletResponse resp){
		
			
		
		return "card";
	}
	
	@RequestMapping(value="/del.action")
	public String del(Integer bnum,HttpServletRequest req, HttpServletResponse resp){
		
		dao.delbasket(bnum);
				
		
		
		return "redirect:basket.action";
	}
	
}
