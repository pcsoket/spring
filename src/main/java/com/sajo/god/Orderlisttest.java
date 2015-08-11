package com.sajo.god;

import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.RequestMapping;

import com.sajo.dao.PurchaseDAO;
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
		
		
		String userId = "1";// �׽�Ʈ ���̵�. �α������������� ��ü�ؾ���
		
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
				dao.getList(start, end, searchValue, userId);
			
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
			cp + "/article.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		//������ �� �������� �����͸� �ѱ��
		request.setAttribute("lists", lists);
		request.setAttribute("pageIndexList",pageIndexList);
		request.setAttribute("dataCount",dataCount);
		request.setAttribute("articleUrl",articleUrl);
	

		return "shopOrderList";
	}
}
