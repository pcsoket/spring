package com.sajo.god;

import java.io.File;
import java.util.ArrayList;

import java.util.Iterator;
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
import com.sajo.dto.LoginDTO;
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
	
	@RequestMapping(value="/invent.action",method={RequestMethod.GET,RequestMethod.POST})  //테스트
	public String invent(HttpServletRequest req, String data) throws Exception{
		
		 
				
		return "Invent";
	}
	
	@RequestMapping(value="/basket.action")
	public String basket(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");  //세션에서 로그인정보가져오기
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			return "login";
		}
		
		String savePath = "example" + File.separator + "resources" + File.separator + "imageFile";
		
		String cp = request.getContextPath();
		
		int dataCount = dao.getDataCount(logInfo.getUserId());
		
		List<BasketDTO> lists = (List<BasketDTO>)dao.readPro(logInfo.getUserId());
		
		//String urlList = cp + "/img/list.action";
		
		String imageUrl = "/example/resources/imageFile";
		
		request.setAttribute("savePath", savePath);
		request.setAttribute("imageUrl", imageUrl);
		request.setAttribute("bklists", lists);
		request.setAttribute("dataCount", dataCount);
		
		return "basket";
	}
	
/*	@RequestMapping(value="/orderList.action")
	public String orderList(){
		
		
		return "shopOrderList";
	}
	*/
/*	@RequestMapping(value="/cancel.action")
	public String orderCancel(){
		
		
		
		return "shopordercancel";
	}*/
	
	
	@RequestMapping(value="/toBasket.action")
	public String toBasket(BasketDTO dto ,HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			return "login";
		}
		
		dto.setUserId(logInfo.getUserId());            //아이디 추가
		dto.setbNum(dao.maxNum()+1);            //bnum생성
		
		dao.insertBK(dto);
		
		return "redirect:basket.action";
	}
	
	@RequestMapping(value="/direct.action")
	public String direct(Integer bNum, Integer amount,HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			return "login";
		}
		
		MemberDTO mdto = mdao.getReadData(logInfo.getUserId());
		
		//System.out.println(mdto.getUserName());
		BasketDTO dto = dao.readbasket(bNum);
		PurchaseDTO pdto = pdao.getReadData(dto.getpNum());
		
		System.out.println(bNum+":"+pdto.getpPrice());
		//int total = dto.getbPrice() * amount;
		req.setAttribute("bnums", bNum);
		req.setAttribute("pdto", pdto);
		req.setAttribute("amount", amount);
		//req.setAttribute("total", total);
		req.setAttribute("mdto", mdto);
		
		return "purchase";
	}
	
	@RequestMapping(value="/basket_ok.action")
	public String basket_ok(String bnums, String amt,String price, String total,HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			return "login";
		}
		
		String mid = logInfo.getUserId();
		
		MemberDTO mdto = mdao.getReadData(mid);
		
		if(bnums != null){
			
			String[] nums= bnums.split("-");
			String[] amts= amt.split("-");
			
			System.out.println(nums.length);
			System.out.println(bnums);
			System.out.println(amt);
			
			PurchaseDTO pdto;
			for(int i=0;i<nums.length;i++){
				
				BasketDTO dto = dao.readbasket(Integer.parseInt(nums[i]));
				
				System.out.println(2 + "nums:" + nums[i]);
				System.out.println(nums.length);
				pdto = new PurchaseDTO();
				
				pdto.setbNum(dto.getbNum());
				
				System.out.println(3 +  dto.getbNum());
				pdto.setpAmount(Integer.parseInt(amts[i]));
				pdto.setpName(dto.getbPName());
				pdto.setpPrice(Integer.parseInt(amts[i]) * dto.getbPrice());
				pdto.setmId(mid);
				pdto.setmAddr(mdto.getUserAddr2());
				pdto.setState("결제전");
				pdto.setRetake(0);
				pdto.setpNum(dto.getpNum());
				

				int result = pdao.insertData(pdto);
				
				if (result!=0) {
						
						dao.delbasket(Integer.parseInt(nums[i]));
						
					}
					
					
			}
			
			//req.setAttribute("pdto", pdto);
			
			
			
		}else{
			
			BasketDTO dto = dao.readbasket(Integer.parseInt(bnums));
			
			PurchaseDTO pdto = new PurchaseDTO();
			System.out.println(4);
			
			pdto.setbNum(dto.getbNum());
			pdto.setpAmount(dto.getbAmount());
			pdto.setpName(dto.getbPName());
			pdto.setpPrice(dto.getbPrice());
			pdto.setmId(mid);
			pdto.setmAddr(mdto.getUserAddr2());
			pdto.setbDate("");
			pdto.setState("결제전");
			pdto.setRetake(0);
			pdto.setpNum(dto.getpNum());
			
			pdao.insertData(pdto);
			
		}
		
		
	
		
		PurchaseDTO pdto = pdao.getBnums(mid);
		System.out.println("11" + pdto.getbNum());
		System.out.println("12"+pdto.getmId());
		
		req.setAttribute("mdto", mdto);
		req.setAttribute("pdto", pdto);
		req.setAttribute("bnums", bnums);
		req.setAttribute("ptotal", price);
		req.setAttribute("total", total);
		
		
		return "purchase";
	}
	
	
	@RequestMapping(value="/card.action")
	public String card(String bnums,HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			return "login";
		}
		
		System.out.println("여기는" + bnums);
		
		req.setAttribute("bnums", bnums);
				
		return "card";
	}
	
	@RequestMapping(value="/card_ok.action")
	public String card_ok(String bnums,HttpServletRequest req, HttpServletResponse resp){
		
		HttpSession session = req.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo==null){                                              //로그인이 필요한 페이지에 꼭넣어야함 없을경우 null값으로 인한 에러뜸
			return "login";
		}
		
		System.out.println("널인가!!" + bnums);
		
		if(bnums != null){
			
			System.out.println("널인가" + bnums);
			String[] nums= bnums.split("-");
			
			
			for(int i = 0;i<nums.length;i++){
				
				pdao.updateData(Integer.parseInt(nums[i]));
			
			}
			
		}
		
		return "redirect:orderList.action";
	}
	
	
	
	@RequestMapping(value="/card_cancle.action")
	public String card_cancel(String bnums, HttpServletRequest req, HttpServletResponse resp,HttpSession session){
		
		//String id = (String)session.getAttribute("userId"); //session에서 id받아오기
		
		String mid = "5";
		BasketDTO dto = null;
		PurchaseDTO pdto;
		List<PurchaseDTO> lists = (List<PurchaseDTO>)pdao.getReadId(mid);
		
		Iterator<PurchaseDTO> reinst = lists.iterator();
		
		
		while(reinst.hasNext()){
			
			pdto = (PurchaseDTO)reinst.next();
			
			
			dto.setbNum(pdto.getbNum());
			dto.setbAmount(1);
			dto.setbPName(pdto.getpName());
			dto.setbPrice(pdto.getpPrice()/pdto.getpAmount());
			dto.setUserId(mid);
			dto.setbNum(pdto.getpNum());
			
			dao.insertBK(dto);
			
			
		}
		

		
		
		if(bnums != null){
			
			System.out.println("널인가" + bnums);
			String[] nums= bnums.split("-");
			
			//PurchaseDTO pdto=null;
			for(int i = 0;i<nums.length;i++){
				
				pdto = pdao.getReadData(Integer.parseInt(nums[i]));
				
				dto = new BasketDTO();
				
				System.out.println(nums[i]);
				dto.setbNum(Integer.parseInt(nums[i]));
				dto.setbAmount(1);
				dto.setbPName(pdto.getpName());
				dto.setbPrice(pdto.getpAmount()/pdto.getpPrice());
				dto.setUserId(mid);
				dto.setbNum(pdto.getpNum());
				dto.setImgNum(pdto.getImgNum());
				
				
				int result = dao.insertBK(dto);
				
				if (result!=0) {
						
						pdao.deleteData(Integer.parseInt(nums[i]));
						
					}
				
				
			}

		}
	

		return "redirect:basket.action";

	}
	
	@RequestMapping(value="/del.action")
	public String del(Integer bnum,HttpServletRequest req, HttpServletResponse resp){
		
		dao.delbasket(bnum);
				
		
		
		return "redirect:basket.action";
	}
	
}
