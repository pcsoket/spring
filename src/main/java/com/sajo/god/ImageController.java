package com.sajo.god;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.Calendar;
import java.util.List;
import java.util.ListIterator;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sajo.util.MyUtil;
import com.sajo.dao.ImageDAO;
import com.sajo.dto.ImageDTO;

@Controller
public class ImageController {

	@Autowired
	@Qualifier("imageDAO") //중복방지
	ImageDAO dao;

	@Autowired
	MyUtil myUtil;

	@RequestMapping(value="/img/list.action", method={RequestMethod.GET,RequestMethod.POST})
	public String list(HttpServletRequest request, HttpServletResponse response) throws Exception{

		//HttpSession session = request.getSession();
		//String root = session.getServletContext().getRealPath("/");

		//System.out.println(root);
		//String savePath = root + "WEB-INF" + File.separator + "imageFile";
		String savePath = "example" + File.separator + "resources" + File.separator + "imageFile";
		System.out.println(savePath);
		String cp = request.getContextPath();

		String pageNum = request.getParameter("pageNum");
		int numPerPage = 9;
		int totalPage = 0;
		int totalDataCount = 0;

		int currentPage = 1;

		if(pageNum!=null && !pageNum.equals(""))
			currentPage = Integer.parseInt(pageNum);

		totalDataCount = dao.getDataCount();

		if(totalDataCount!=0)
			totalPage = myUtil.getPageCount(numPerPage, totalDataCount);

		if(currentPage > totalPage)
			currentPage = totalPage;

		int start = (currentPage-1)*numPerPage+1;
		int end = currentPage*numPerPage;


		List<ImageDTO> lists = (List<ImageDTO>)dao.getList(start, end);

		int listNum, n=0;

		ListIterator<ImageDTO> it = lists.listIterator();

		while(it.hasNext()){

			ImageDTO data = (ImageDTO)it.next(); //한개의 데이터에 대한 객체생성?

			listNum = totalDataCount-(start+n-1);
			data.setListNum(listNum);
			n++;
		}

		String param = "";
		String urlList = "";

		//사용자정의-----------------------------------------------------
		urlList = cp + "/img/list.action";

		if(!param.equals("")){

		}//--------------------------------------------------------------
		String imageUrl = "/example/resources/imageFile";
		//String imageUrl =  request.getSession().getServletContext().getRealPath("/WEB-INF/imageFile/");
		
		request.setAttribute("savePath", savePath);
		request.setAttribute("imageUrl", imageUrl);
		request.setAttribute("lists", lists);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("totalDataCount", totalDataCount);
		request.setAttribute("pageIndexList", myUtil.pageIndexList(currentPage, totalPage, urlList));

		return "image/list";
		
	}
	
	@RequestMapping(value="/img/created.action", method={RequestMethod.GET})
	public String created() throws Exception{
		
		return "image/write";// 입력창 띄우기
		
	}
	
	@RequestMapping(value="/img/created.action", method={RequestMethod.POST})
	public String created(ImageDTO dto,MultipartHttpServletRequest request) throws Exception{
		
		String path = request.getSession().getServletContext().getRealPath("/resources/imageFile/");

		File dir = new File(path);
		if (!dir.exists())
			dir.mkdirs();

		MultipartFile file = request.getFile("upload");


		//System.out.println(file.getOriginalFilename());

		//System.out.println(file);
		if (file != null && file.getSize() > 0) {

			try {
				String newFileName = null;

				
				/*String fileExt = dto.getUploadFileName().substring(dto.getUploadFileName().lastIndexOf("."));
				if(fileExt == null || fileExt.equals(""))
					return null;*/

				newFileName = String.format("%1$tY%1$tm%1$td%1$tH%1$tM%1$tS", Calendar.getInstance());
				newFileName += System.nanoTime();
				//newFileName += fileExt;

				FileOutputStream ostream = new FileOutputStream(path + "/" + file.getOriginalFilename());

				InputStream istream = file.getInputStream();

				byte[] buffer = new byte[512];

				while (true) {

					int count = istream.read(buffer, 0, buffer.length);

					if (count == -1)
						break;

					ostream.write(buffer, 0, count);

				}

				System.out.println(newFileName);
				istream.close();
				ostream.close();
				dto.setSaveFileName(newFileName);

			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		int maxNum = dao.getMaxNum();

		dto.setImgNum(maxNum + 1);
		dto.setUploadFileName("test");
		dto.setOriginalFileName(file.getOriginalFilename());
		dao.insertData(dto);

		return "redirect:/img/list.action";
	}

	@RequestMapping(value="/img/deleted.action", method={RequestMethod.GET,RequestMethod.POST})
	public String deleted(ImageDTO dto, HttpServletRequest request, HttpServletResponse response) throws Exception{

		//HttpSession session = request.getSession();

		//String root = session.getServletContext().getRealPath("/");
		String savePath = request.getSession().getServletContext().getRealPath("/resources/imageFile/");
		//String savePath = "example" + File.separator + "resources" + File.separator + "imageFile";

		int num = Integer.parseInt(request.getParameter("num"));

		dto = (ImageDTO)dao.getReadData(num);

		File file = null;
		
		//System.out.println("삭제:"+dto.getOriginalFileName());
		//System.out.println("넘버:"+num);
		
		String fullFileName = savePath + "\\"+ dto.getOriginalFileName();
        
		//System.out.println("경로"+fullFileName);
		file = new File(fullFileName);
        if (file.exists())
           file.delete();
        
		//FileManager.doFileDelete(dto.getSaveFileName(), savePath);

		dao.deleteData(num);

		return "redirect:/img/list.action";
	}

}
