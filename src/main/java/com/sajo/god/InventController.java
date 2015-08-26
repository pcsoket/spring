package com.sajo.god;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.sajo.dao.ImageDAO;
import com.sajo.dao.InventDAO;
import com.sajo.dto.InventDTO;

@Controller
public class InventController {
	
	@Autowired
	@Qualifier("inventDAO")
	InventDAO dao;
	
	@Autowired
	@Qualifier("imageDAO")
	ImageDAO idao;
	
	@RequestMapping(value="/inventList.action")
	public String imgList(HttpServletRequest req,HttpServletResponse resp, HttpSession session){
		
		int gNum = Integer.parseInt(req.getParameter("gNum"));
		int pageNum = Integer.parseInt(req.getParameter("pageNum"));
		
		 int gno = dao.getGno(gNum);
		 
		if(gno!=0){
			System.out.println(0);
			InventDTO dto1 = dao.getInventData(gno);
			if(dto1==null){
				String ImageoriginalFile1 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
				System.out.println(1);
			}else{
			String ImageoriginalFile1 = idao.getImage(dto1.getImgnum());
			req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
			System.out.println(2);
			}
			InventDTO dto2 = dao.get3dData(gno);
			if(dto2==null){
				String ImageoriginalFile2 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
				System.out.println(3);
			}else{
			String ImageoriginalFile2 =idao.getImage(dto2.getImgnum());
			req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
			System.out.println(4);
			}
			InventDTO dto3 = dao.getSketchData(gno);
			if(dto3==null){
				String ImageoriginalFile3 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
				System.out.println(5);
			}else{
			String ImageoriginalFile3 =idao.getImage(dto3.getImgnum());
			req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
			System.out.println(6);
			}
		}else{
				String ImageoriginalFile1 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile1", ImageoriginalFile1);
				String ImageoriginalFile2 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile2", ImageoriginalFile2);
				String ImageoriginalFile3 = "/god/resources/imageFile/asdf.jpg";
				req.setAttribute("ImageoriginalFile3", ImageoriginalFile3);
		}
		
		
		req.setAttribute("pageNum", pageNum);
		req.setAttribute("gNum", gNum);
		
		return "Invent";
		
		
		
	}
}
