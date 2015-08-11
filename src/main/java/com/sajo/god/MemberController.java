package com.sajo.god;

import java.io.FileOutputStream;
import java.io.InputStream;
/*import java.io.FileOutputStream;
import java.io.InputStream;*/
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
/*import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;*/
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
	public ModelAndView created(String userPimg, String userPimgUrl){
		
		ModelAndView mav = new ModelAndView();
		/*System.out.println(userPimg);
		if(userPimg != null || userPimgUrl != null){
			mav.addObject(userPimg);
			mav.addObject(userPimgUrl);
			System.out.println(userPimg);
		}
		System.out.println("123");*/
		mav.setViewName("signIn");
		
		return mav;
		
	}
	
	@RequestMapping(value="/write_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String write(MultipartHttpServletRequest req,HttpServletRequest request,HttpServletResponse resp,MemberDTO dto){
		
		String path = 
				req.getSession().getServletContext().getRealPath("/resources/testimg/");
		
		if(dto.getUserId()==null){

			return "signIn";
			
		}
		//주소 입력
		String code1 = request.getParameter("code1");
		String code2 = request.getParameter("code2");
		String addr1 = request.getParameter("addr1");
		String addr2 = request.getParameter("addr2");
		MultipartFile pimg = req.getFile("file2");
		String userpimg = pimg.getOriginalFilename();
		
		
		
		String maddr = code1 + "-" + code2;
		maddr += addr1 + addr2;
		
		
		dto.setUserPimg(path+"\\"+userpimg);
		dto.setUserAddr(maddr);
		
		if(pimg!=null && pimg.getSize()>0){
			
			
			try {
				
				FileOutputStream ostream = 
						new FileOutputStream(path + "/" + pimg.getOriginalFilename());
				
				InputStream istream = pimg.getInputStream();
				
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
		//dao.insertData(dto);

		return "shop";
	}
	
	@RequestMapping(value="/deleted.action",method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(HttpServletRequest req,HttpServletResponse resp,HttpSession session){
		
		String userId = (String)session.getAttribute("userId");
		
		dao.deleteData(userId);
		
		return"redirect:/shopMain.action";
	}
	
	@RequestMapping(value="/zipcode.action",method={RequestMethod.GET,RequestMethod.POST})
	public String searchAddr(HttpServletRequest req,HttpServletResponse resp) throws Exception{
		
		String dong = req.getParameter("juso");
		
		if(dong==null||dong.equals("")){
			
			return "searchAddr";
			
		}
		
		
		List<AddrDTO> lists =
			dao.getAddrList(dong);
		
		
		req.setAttribute("lists", lists);
		
	
		return "searchAddr";
		
	}
	
	@RequestMapping(value="/idchk.action")
	public String idchk(HttpServletRequest req,HttpServletResponse resp){
		
		String userId=req.getParameter("userId");
		
		
		req.setAttribute("userId",userId);
		return "idchk";
		
	}
	
	@RequestMapping(value="/idchk_chk.action",method={RequestMethod.GET,RequestMethod.POST})
	public String idchk_chk(HttpServletRequest req,HttpServletResponse resp,MemberDTO dto){
		
		String userId = req.getParameter("userId");
		
		req.removeAttribute("message");
		req.removeAttribute("message1");
		
		dto = dao.idchk(userId);
		
		if(dto==null){
			req.setAttribute("userId",userId);
			req.setAttribute("message1", "사용 가능 합니다...");
		}else if(dto.getUserId()!=null||!dto.getUserId().equals("")){
		
			
			req.setAttribute("message", "ID가 존재 합니다...");
		}
		
		
		return "idchk";
		
	}
	
}
