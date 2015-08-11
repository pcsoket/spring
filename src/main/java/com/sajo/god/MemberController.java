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
	public ModelAndView created(){
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("signIn");
		
		return mav;
		
	}
	
	@RequestMapping(value="/write_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String write(HttpServletRequest req,HttpServletRequest request,HttpServletResponse resp,MemberDTO dto){
		
		System.out.println(dto.getUserId());
		
		if(dto.getUserId()==null){

			return "signIn";
			
		}
		//주소 입력
		String code1 = req.getParameter("code1");
		String code2 = req.getParameter("code2");
		String addr1 = req.getParameter("addr1");
		String addr2 = req.getParameter("addr2");
		
		String maddr = code1 + "-" + code2;
		maddr += addr1 + addr2;
		
		dto.setUserAddr(maddr);
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
	
	@RequestMapping(value="/upload.action")
	public String upload(){
		
		return "uploadPimg";
		
	}
	
	@RequestMapping(value="/upload_ok.action",method={RequestMethod.GET,RequestMethod.POST})
	public String upload_ok(HttpServletRequest request,MultipartHttpServletRequest req,String data) throws Exception{		
		
		String path = 
				req.getSession().getServletContext().getRealPath("/resources/testimg/");
		
		MultipartFile file = req.getFile("file2");
		
		System.out.println(file.getOriginalFilename());
		
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
		request.setAttribute("userPimg", file.getOriginalFilename());
		request.setAttribute("userPimgUrl", path+file.getOriginalFilename());
		
		return "redirect:/god/write.action";
	}
	
	/*@RequestMapping(value="/idchk.action",method={RequestMethod.GET,RequestMethod.POST})
	public String idchk(HttpServletRequest req,HttpServletResponse resp,MemberDTO dto){
		
		String userId = req.getParameter("userId");
		
		dto = dao.idchk(userId);
		
		if(!dto.equals("")||dto!=null)
			
			req.setAttribute("message", "ID가 존재 합니다...");
			
		
		return "idchk";
		
	}*/
	
}
