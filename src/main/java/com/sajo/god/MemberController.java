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
	
	
	//회원가입 page 열기
	@RequestMapping(value="/write.action")
	public ModelAndView created(){
		
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("signIn");
		
		return mav;
		
	}
	
	//회원 가입 코딩
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
		MultipartFile pimg = req.getFile("file2");
		String userpimg = (String)pimg.getOriginalFilename();
		String maddr = code1 + "-" + code2;
		
		String phn1 = request.getParameter("phn1");
		String phn2 = request.getParameter("phn2");
		String phn3 = request.getParameter("phn3");
		String userTel = phn1 + "-" + phn2 + "-" + phn3; 
		
		dto.setUserTel(userTel);
		dto.setUserPimg(userpimg);
		dto.setUserAddr1(maddr);
		
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
		
		dao.insertData(dto);

		return "shop";
	}
	
	//회원 탈퇴 코딩
	@RequestMapping(value="/deleted.action")
	public String deleted(HttpServletRequest req,HttpServletResponse resp,HttpSession session){
		
		String userId = (String)session.getAttribute("userId");
		String userPwd = (String)session.getAttribute("userPwd");
		
		dao.deleteData(userId);
		
		session.removeAttribute("userId");
		session.removeAttribute("userPwd");
		
		return"redirect:/shopmain.action";
	}
	
	//주소 검색
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
	
	//ID 중복체크 창 열기
	@RequestMapping(value="/idchk.action")
	public String idchk(HttpServletRequest req,HttpServletResponse resp){
		
		String userId=req.getParameter("userId");
		
		
		req.setAttribute("userId",userId);
		return "idchk";
		
	}
	
	//ID 중복체크 코딩
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
	
	//회원정보 수정 page 열기
	@RequestMapping(value="/myPage.action")
	public String myPage(HttpServletRequest req,HttpServletResponse resp,MemberDTO dto,HttpSession session){
		
	
		String userId= (String)session.getAttribute("userId");
		
		if(userId==null||userId.equals("")){
			
			return "shopMyPage";
			
		}
		
		dto= dao.getReadData(userId);
		
		String savepath = "/god/resources/testimg/";
		String pimg = savepath + dto.getUserPimg();
		dto.setUserPimg(pimg);
		System.out.println(dto.getUserPimg());
		String[] addr = dto.getUserAddr1().split("-");
		
		String code1 = addr[0];
		String code2 = addr[1];
		
		String[] phn = dto.getUserTel().split("-");
		String phn1 = phn[0];
		String phn2 = phn[1];
		String phn3 = phn[2];
			
		req.setAttribute("code1", code1);
		req.setAttribute("code2", code2);
		req.setAttribute("phn1", phn1);
		req.setAttribute("phn2", phn2);
		req.setAttribute("phn3", phn3);
		req.setAttribute("dto", dto);
		return "shopMyPage";
	}
	
	//회원정보 수정 코딩
	@RequestMapping(value="/mupdated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(MultipartHttpServletRequest request,HttpServletRequest req,HttpServletResponse resp,MemberDTO dto,HttpSession session){
		
		String phn1 = req.getParameter("phn1");
		String phn2 = req.getParameter("phn2");
		String phn3 = req.getParameter("phn3");
		String phn = phn1+"-"+phn2+"-"+phn3;
		dto.setUserTel(phn);
		
		String code1 = req.getParameter("code1");
		String code2 = req.getParameter("code2");
		String addr1 = code1 +"-" + code2;
		
		dto.setUserAddr1(addr1);
		
		String path = 
				request.getSession().getServletContext().getRealPath("/resources/testimg/");
		
		MultipartFile pimg = request.getFile("file2");
		String userpimg = (String)pimg.getOriginalFilename();
		
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
		
		dto.setUserPimg(userpimg);
		
		dao.updated(dto);
		
	
		return "redirect:/myPage.action";
	}

	@RequestMapping(value="/memberList.action")
	public String memberList(HttpServletRequest req,HttpServletResponse resp,MemberDTO dto,HttpSession session){
		
		List<MemberDTO> lists = dao.getTotalReadData();
		
		
		
		req.setAttribute("lists", lists);
		
		return "/invent/memberList";
		
	}
	
}
