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
//import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.sajo.dao.MemberDAO;
import com.sajo.dto.AddrDTO;
import com.sajo.dto.LoginDTO;
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
				req.getSession().getServletContext().getRealPath("/resources/imageFile/");
		
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

		return "category";
	}
	
	//회원 탈퇴 코딩
	@RequestMapping(value="/deleted.action")
	public String deleted(HttpServletRequest req,HttpServletResponse resp,HttpSession session,LoginDTO dto){
		
		dto  = (LoginDTO)session.getAttribute("logInfo");
		
		dao.deleteData(dto.getUserId());
		
		session.removeAttribute("logInfo");
		session.invalidate();
		
		return"redirect:/ideaMain.action";
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
	
		LoginDTO dto1 = (LoginDTO)session.getAttribute("logInfo");
		
		
		if(dto1==null){
			
			return "redirect:/login.action";
			
		}
		
		dto= dao.getReadData(dto1.getUserId());
		
		String savepath = "/god/resources/imageFile/";
		String pimg = savepath + dto.getUserPimg();
		dto.setUserPimg(pimg);
		
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
		return "myPage";
	}
	
	//회원정보 수정 코딩
	@RequestMapping(value="/mupdated.action",method={RequestMethod.GET,RequestMethod.POST})
	public String updated(MultipartHttpServletRequest request,HttpServletRequest req,HttpServletResponse resp,MemberDTO dto,HttpSession session){
		
		String userpimg;
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
				request.getSession().getServletContext().getRealPath("/resources/imageFile/");
		
		
		MultipartFile pimg = request.getFile("file2");
		userpimg = (String)pimg.getOriginalFilename();
		
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
		
			
		dto.setUserPimg(userpimg);
		}else{
		
		userpimg = req.getParameter("img");
		
		String[] a = userpimg.split("/");

		dto.setUserPimg(a[4]);
		}
			
		dao.updated(dto);
		
	
		return "redirect:/myPage.action";
	}

	@RequestMapping(value="/memberList.action")
	public String memberList(HttpServletRequest req,HttpServletResponse resp,MemberDTO dto,HttpSession session){
		
		String cp = req.getContextPath();
		String pageNum = req.getParameter("pageNum");
		String searchKey = req.getParameter("searchKey");
		String searchValue = req.getParameter("searchValue");
		
		int currentPage = 1;
		
		if(pageNum != null)
			currentPage = Integer.parseInt(pageNum);
		
		if(searchKey == null){
			
			searchKey = "mid";
			searchValue = "";
			
		}
		
		//전체데이터갯수
				int dataCount = dao.getListDataCount(searchKey, searchValue);
				
				//전체페이지수
				int numPerPage = 9;
				int totalPage = myUtil.getPageCount(numPerPage, dataCount);
				
				if(currentPage > totalPage)
					currentPage = totalPage;
				
				int start = (currentPage-1)*numPerPage+1;
				int end = currentPage*numPerPage;
				
				List<MemberDTO> lists = dao.getTotalReadData(start,end,searchKey,searchValue);
				
				//페이징 처리
				String param = "";
				if(!searchValue.equals("")){
					param = "searchKey=" + searchKey;
					param+= "&searchValue=" + searchValue;
					
				}
				
				String listUrl = cp + "/memberList.action";
				if(!param.equals("")){
					listUrl = listUrl + "?" + param;				
				}
				
				String pageIndexList =
					myUtil.pageIndexList(currentPage, totalPage, listUrl);
		
		req.setAttribute("lists", lists);
		req.setAttribute("pageIndexList",pageIndexList);
		req.setAttribute("dataCount",dataCount);
		
		return "memberList";
		
	}
	
	@RequestMapping(value="/gnoInsert.action")
	public String gnoInsert(HttpServletRequest req,HttpServletResponse resp,LoginDTO dto,HttpSession session){
		
		 dto = (LoginDTO)session.getAttribute("logInfo");
		
//		int gno = Integer.parseInt(req.getParameter("gno"));
		 int gno=1;
		 
		if(dto==null){
			
			return "redirect:/login.action";
			
		}
		
	//	 System.out.println(dto.getUserId());
		dao.insertGno(dto.getUserId(), gno);		
		
		dto.setGno(gno);

		session.setAttribute("logInfo", dto);
		
		return "redirect:/ideaArticle.action";
	}
	
	@RequestMapping(value="/gnoDelete.action")
	public String gnoDelete(HttpServletRequest req,HttpServletResponse resp,LoginDTO dto,HttpSession session){
		
		dto = (LoginDTO)session.getAttribute("logInfo");
		//dto.setGno(Integer.parseInt((String)session.getAttribute("logInfo.gno")));	
		dao.deleteGno(dto.getUserId());
		
		dto.setGno(0);
		
		session.setAttribute("logInfo", dto);
		
		
		return "redirect:/ideaArticle.action";
		
	}
	
}
