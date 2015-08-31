package com.sajo.god;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import com.sajo.dao.IdeaMainDAO;
import com.sajo.dao.ImageDAO;
import com.sajo.dto.LoginDTO;
import com.sajo.dto.MainListDTO;

import com.sajo.util.MyUtil;


@Controller
public class IdeaMainController {
	

	@Autowired
	@Qualifier("ideaMainDAO") //중복방지
	IdeaMainDAO dao;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@Autowired
	MyUtil myUtil;
	
	@RequestMapping(value="/ideaMain.action",method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest req, HttpSession session, String data) throws Exception{		
		
		LoginDTO logInfo = (LoginDTO) session.getAttribute("logInfo");
		
		if(logInfo!=null){
				int gno = logInfo.getGno();
				String userId=logInfo.getUserId();
			if(gno!=0){
				MainListDTO dto1 = dao.getData(userId,"idea");
				MainListDTO dto2 = dao.getData(userId,"sketch");
				MainListDTO dto3 = dao.getData(userId,"3D");
				
				if(dto1!=null){
					System.out.println(dto1.getImgNum()+"00");
				String ImageoriginalFile1 = idao.getImage(dto1.getImgNum());
				System.out.println("99");
				req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
				req.setAttribute("dto1", dto1);
				}
				if(dto2!=null){
				String ImageoriginalFile2 = idao.getImage(dto2.getImgNum());
				req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
				req.setAttribute("dto2", dto2);
				}
				if(dto3!=null){
				String ImageoriginalFile3 = idao.getImage(dto3.getImgNum());
				req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
				req.setAttribute("dto3", dto3);
				}
				
			}else{
			req.removeAttribute("dto1");
			req.removeAttribute("dto2");
			req.removeAttribute("dto3");
			req.removeAttribute("imageoriginalFile1");
			req.removeAttribute("imageoriginalFile2");
			req.removeAttribute("imageoriginalFile3");
			}
			
		}	
		//인기아이디어 순위
		
		List<MainListDTO> idealists = idao.imageForMlList(dao.getIdeaReadData());
		req.setAttribute("idealists", idealists);
		
	
		
		//complate 순위
		
		return "ideamain";
	}
	
/*	@RequestMapping(value="/ideaArticle.action")
	public String ideaArticle(HttpServletRequest req,HttpServletResponse resp,HttpSession session){
		
		
		
		
		
		return "/board/ideaArticle";
	}*/
	
	@RequestMapping(value="/header.action")
	public String header(){
		
		
		return "header";
	}
	
	@RequestMapping(value="/invent.action")
	public String invent(){
		
		
		return "invent";
	}

}
