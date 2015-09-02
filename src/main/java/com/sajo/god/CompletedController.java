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
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dao.CompletedDAO;
import com.sajo.dao.ImageDAO;
import com.sajo.dto.CompletedDTO;
import com.sajo.dto.ImageDTO;
import com.sajo.util.MyUtil;

@Controller
public class CompletedController {
	
	@Autowired
	MyUtil myUtil;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@Autowired
	@Qualifier("completedDAO")
	CompletedDAO cpdao;
	
	
	
	@RequestMapping(value="/compl/created.action")
	public ModelAndView compl_created(HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
			ModelAndView mav = new ModelAndView();
			mav.setViewName("invent/created");
			
			return mav;
		
		
	}
	
	@RequestMapping(value="/compl/created_ok.action")
	public ModelAndView compl_created_ok(CompletedDTO cpdto,ImageDTO idto,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
		ModelAndView mav = new ModelAndView();
		
		String path = req.getSession().getServletContext().getRealPath("/resources/imageFile/"); //������ ��� ���� ������θ� ������
		//null�� ���� imageDTO�� �����θ� �־��ָ� image���̺� �����ϰ� ������ �̹������� �ѹ��� String���� ��ȯ
		String imglistnum = idao.writeFile(idto, path);  //ex "3,4,5"��ȯ
		
		System.out.println(path);
		System.out.println(imglistnum);
		
		cpdto.setCpNum(cpdao.cp_maxNum()+1); //product��ȣ����
		cpdto.setImgNum(imglistnum);        //product ���� �ѷ��� �̹������� ��ȣ
		cpdao.p_insertData(cpdto);          //product ���̺� insert
		mav.setViewName("redirect:/completed.action"); //?cpNum="+cpdto.getCpNum()); //������
		mav.addObject("cpdto",cpdto); //������?
		
		return mav;
		
	}
	
	
	@RequestMapping(value="/completed.action")
	public String completed(CompletedDTO cpdto,HttpServletRequest req,HttpServletResponse resp, HttpSession session) throws Exception{
		
		String cp = req.getContextPath();
		
		//String boardName = "group";
		
		String pageNum = req.getParameter("pageNum");
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		if(searchKey == null){
			
			searchKey = "gSubject";
			searchValue = "";
			
		}else{
			
			if(req.getMethod().equalsIgnoreCase("GET"))
				searchValue =
					URLDecoder.decode(searchValue, "UTF-8");
			
		}
		
		//��ü�����Ͱ���
		int dataCount = 0;
		dataCount = cpdao.cp_getDataCount(searchKey, searchValue);
		
		//��ü��������
		int numPerPage = 9;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		
		if(currentPage > totalPage)
			currentPage = totalPage;
		
		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;
		System.out.println(start+":"+end+":"+searchKey+":"+searchValue+"::");
		List<CompletedDTO> lists =
			cpdao.cp_getList(start, end, searchKey, searchValue);
		
		lists = idao.imageForcList(lists);
		
		ListIterator<CompletedDTO> it = lists.listIterator();

		int listNum, n=0;

		while(it.hasNext()){
			
			cpdto = (CompletedDTO)it.next();
			listNum = dataCount - (start+n-1);
			cpdto.setListNum(listNum);
			n++;			
		}
		
		//����¡ ó��
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
		
		//�ۺ��� �ּ� ����
		String articleUrl = 
			cp + "/inventList.action?pageNum=" + currentPage;
			
		if(!param.equals(""))
			articleUrl = articleUrl + "&" + param;
		
		
		//������ �� �������� �����͸� �ѱ��
		req.setAttribute("lists", lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		req.setAttribute("articleUrl",articleUrl);
		//req.setAttribute("boardName", boardName);
		
	
		
		List<CompletedDTO> belists = cpdao.getbest();
		
		belists = idao.imageForcList(lists);
		
		req.setAttribute("clists", belists);

		return "invent/completed";
	}

}
