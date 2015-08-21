package com.sajo.god;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.time.Year;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.sajo.dao.PurchaseDAO;
import com.sajo.dto.LoginDTO;
import com.sajo.dto.PurchaseDTO;
import com.sajo.util.MyUtil;


@Controller
public class Orderlisttest {
	
	@Autowired
	PurchaseDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping("/orderList.action")
	public String orderList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		HttpSession session = request.getSession();
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo==null){                                              //�α����� �ʿ��� �������� ���־���� ������� null������ ���� ������
			return "login";
		}
		
		String cp = request.getContextPath();
		
		int currentPage = 1;

		String searchValue = request.getParameter("searchValue");
		
		if(searchValue == null||searchValue.equals("")){
			
			searchValue = "";
			
		}else{
			
			if(request.getMethod().equalsIgnoreCase("GET"))
				searchValue =
					URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//��ü�����Ͱ���
		int dataCount = dao.getDataCount(searchValue);
		
		//��ü��������
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		
		List<PurchaseDTO> lists =
				dao.getList(start, end, searchValue, logInfo.getUserId());
			
		//����¡ ó��
		String param = "";
		if(!searchValue.equals("")){
			param+= "searchValue=" 
				+ URLEncoder.encode(searchValue, "UTF-8");
		}
		
		String listUrl = cp + "/list.action";
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
		
		
	/*	//�˻��� �� ��¥��
		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		int month = cal.get(Calendar.MONTH)+1;
		if(month<10){
		String month1 ="0"+month; 
		}
		int day = cal.get(Calendar.DATE);
		System.out.println(year+":"+month+":"+day);
		
		
		
		request.setAttribute("year", year);
		request.setAttribute("month", month);
		request.setAttribute("day", day);*/
		//������ �� �������� �����͸� �ѱ��
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
	

		return "shopOrderList";
	}
}
