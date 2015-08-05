package com.sajo.god;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dao.MemberDAO;
import com.sajo.dto.AddrDTO;
import com.sajo.dto.MemberDTO;
import com.sajo.util.MyUtil;

@Controller
public class MemberController {
	@Autowired
	@Qualifier("memberDAO")
	MemberDAO dao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/write.action")
	public ModelAndView created(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signIn");
		
		return mav;
		
	}
	
	@RequestMapping(value="/write_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String write(HttpServletRequest req,MultipartHttpServletRequest request,HttpServletResponse resp,MemberDTO dto){
		
		if(dto.getUserId()==null){

			return "/write.action";
			
		}
		//�ּ� ���
		String code1 = req.getParameter("code1");
		String code2 = req.getParameter("code2");
		
		String maddr = code1 + "-" + code2;
		
		dto.setUserAddr(maddr);
		//�̹��� ��� (���� ����)
		/*String path = 
				request.getSession().getServletContext().getRealPath("/WEB-INF/files/");
		
		MultipartFile file = request.getFile("userPimg");
		
		if(file!=null && file.getSize()>0){
			
			
			try {
				
				FileOutputStream ostream = 
						new FileOutputStream(path + "/" + file.getOriginalFilename());
				
				InputStream istream = file.getInputStream();
				
				byte[] buffer = new byte[512];
				
				while(true){
					
					int count = istream.read(buffer, 0, buffer.length);
					if(count==-1){
						
						break;
						
					}
					
					ostream.write(buffer,0,count);
					
				}
				
				istream.close();
				ostream.close();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}
		
		String userPimg = path + "/" + file.getOriginalFilename();
		System.out.println(userPimg);
		dto.setUserPimg(userPimg);
*/		dao.insertData(dto);

		return "shop";
	}
	
	@RequestMapping(value="/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(HttpServletRequest req,HttpServletResponse resp,HttpSession session){
		
		String userId = (String)session.getAttribute("userId");
		
		dao.deleteData(userId);
		
		return"redirect:/shopMain.action";
	}
	
	@RequestMapping(value="/zipcode.action",method={RequestMethod.GET,RequestMethod.POST})
	public String searchAddr(HttpServletRequest req,HttpServletResponse resp) throws UnsupportedEncodingException{
		
		String cp = req.getContextPath();
		String dong = req.getParameter("juso");
		String userId = req.getParameter("userId");
		String userName = req.getParameter("userName");
		String userPwd = req.getParameter("userPwd");
		
		if(dong==null||dong.equals("")){
			
			return "searchAddr";
			
		}
		String pageNum = req.getParameter("pageNum");
		//ù ������
		int currentPage = 1;
		//��ü������ ����
		int dataCount = dao.getDataCount(dong);
		
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		//��ü��������
		int numPerPage = 10;
		int totalPage = myUtil.getPageCount(numPerPage, dataCount);
		
		//����¡ ó��
		String param = "";
		if(!dong.equals("")){
			param = "dong=" + dong;
		
		}
		String listUrl = cp + "/zipcode.action";
		if(!param.equals("")){
			listUrl = listUrl + "?" + param;				
		}
		
		String pageIndexList =
				myUtil.pageIndexList(currentPage, totalPage,listUrl);
		
		
		List<AddrDTO> lists = 
				dao.getAddrList(dong);
	
		req.setAttribute("lists", lists);
		req.setAttribute("pageIndexList", pageIndexList);
		req.setAttribute("dataCount", dataCount);
		req.setAttribute("userId", userId);
		req.setAttribute("userName", userName);
		req.setAttribute("userPwd", userPwd);
		req.setAttribute("userId", userPwd);
		
		return "searchAddr";
		
	}

}
