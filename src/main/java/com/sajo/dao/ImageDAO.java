package com.sajo.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sajo.dto.CompletedDTO;
import com.sajo.dto.GroupDTO;
import com.sajo.dto.ImageDTO;
import com.sajo.dto.MainListDTO;
import com.sajo.dto.ProductDTO;


public class ImageDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	private String imageUrl = "/god/resources/imageFile/";

	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}

	public void insertData(ImageDTO dto){
		
		sessionTemplate.insert("com.sajo.image.insertData",dto);
		
	}
	
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.image.maxNum");
		
		return result;
		
	}
	
	public int getDataCount(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.image.dataCount");
		
		return result;

	}
	
	public List<ImageDTO> getList(int start, int end){
		
		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
	
		List<ImageDTO> lists = sessionTemplate.selectList("com.sajo.image.listData",params);

		return lists;

	}

	public ImageDTO getReadData(int num){
		
		ImageDTO dto = sessionTemplate.selectOne("com.sajo.image.readData",num);
		
		return dto;
	}
	
	public void deleteData(int num){

		sessionTemplate.delete("com.sajo.image.deleteData",num);

	}
	
	//============================================================이미지 배열 저장 및 insert
    public String writeFile(ImageDTO dto,String uploadPath) {
    	
    	
		File dir = new File(uploadPath);//경로가 없으면 만듬
		if (!dir.exists()){
			dir.mkdirs();
		}
    	
        String imageList = "";    //리턴할 imageNum 넣을곳.'gsubject'속성
	
        
        if (dto.getUpload() != null) {  //파일이 있다면
        
	        OutputStream out = null;
	        CommonsMultipartFile[] multipartFiles = dto.getUpload();
	        try {
	        	ImageDTO idto = new ImageDTO();
	            for (CommonsMultipartFile multipartFile : multipartFiles) {
	            	if(multipartFile !=null){
	            		
	            		String fullFileName = uploadPath+ "\\"+multipartFile.getOriginalFilename();
	            		
	            	    System.out.println("fullFileName:"+fullFileName);
	            		
		                out = new FileOutputStream(fullFileName);
		                BufferedInputStream bis = new BufferedInputStream(multipartFile.getInputStream());
		                byte[] buffer = new byte[8106];
		                int read;
		                while ((read = bis.read(buffer)) > 0) {
		                    out.write(buffer, 0, read);
		                }
		
		                IOUtils.closeQuietly(out);
		        		int maxNum = getMaxNum();
		        		System.out.println(maxNum);
		        		idto.setImgNum(maxNum + 1);
		        		idto.setUserId("111");               //임시로 넣어줌 나중에 DTO로 넘어올 부분
		        		
		        		
		        		if(!imageList.equals("")){                  //imgNum ,구분하여 합치기
		        		imageList+=","+idto.getImgNum();
		        		}else {
		        			imageList+=idto.getImgNum();	
						}
		        		
		        		
		        		idto.setUploadFileName("product"); //-----아직쓰는 부분 없음
		        		idto.setOriginalFileName(multipartFile.getOriginalFilename());
		        		idto.setSaveFileName("11");  //임시로 넣어줌.
		        		idto.setTableName("test");  //임시로 넣어줌.
		        		insertData(idto);
		        		bis.close();
						out.close();
	            	}
	            }
	        } catch (IOException ioe) {
	            ioe.getStackTrace();
	        } finally {
	            IOUtils.closeQuietly(out);
	        }
        }else{
        	return "error";
        }
		return imageList;
    }
    
    public List<ImageDTO> getImageList(String imgnumlist) {   //배열로 넣은 이미지 파일 가져오기
    	
    	 String[] imgNum = imgnumlist.split(",");
    	 List<ImageDTO> lists = new ArrayList<ImageDTO>();

    	 for (String imgNO : imgNum) {              //그룹넘버 지정해서 한번에 검색도 가능
    		 
    		 
    		 String img = imageUrl+sessionTemplate.selectOne("com.sajo.image.readImage",Integer.parseInt(imgNO));
			 ImageDTO dto = new ImageDTO();
			 dto.setOriginalFileName(img);
			 lists.add(dto);
    	 }
    	 
    	 return lists;
    }
	public String getImage(String imgnumlist) {   //배열로 넣은 이미지 파일 중 첫번째 가져오기
    	int imgNo = 0;
		System.out.println(imgnumlist);
    	System.out.println(imgnumlist.indexOf(","));
		if(imgnumlist.indexOf(",")==-1){
			imgNo = Integer.parseInt(imgnumlist);
		}else{
			String[] imgNum = imgnumlist.split(",");
	   		imgNo = Integer.parseInt(imgNum[0]);
		}
	
	   	String img = imageUrl + sessionTemplate.selectOne("com.sajo.image.readImage",imgNo);//originalfilename으로 select
   	 
   	return img;
   }
	
	
	public List<ProductDTO> imageForPList (List<ProductDTO> plists){//list.action할때만 사용
		System.out.println("???");
		if(plists!=null){
			ProductDTO dto = new ProductDTO();
			Iterator<ProductDTO> it = plists.iterator();
			while(it.hasNext()){
				
				dto = it.next();
				String img = getImage(dto.getpImg());
				dto.setpImg(img);
				System.out.println(dto.getpImg()+":"+img);
			}
		}
		return plists;
	}
	
	
	public List<GroupDTO> imageForGList (List<GroupDTO> lists){//list.action할때만 사용
		System.out.println("???");
		if(lists!=null){
			GroupDTO dto = new GroupDTO();
			Iterator<GroupDTO> it = lists.iterator();
			while(it.hasNext()){
				
				dto = it.next();
				System.out.println(dto.getImgNum()+":"+dto.getgNum());
				String img = getImage(dto.getImgNum());
				dto.setImgNum(img);
				System.out.println(dto.getImgNum()+":"+img);
			}
		}
		return lists;
	}
	
	public List<CompletedDTO> imageForcList (List<CompletedDTO> lists){//list.action할때만 사용
		System.out.println("???");
		if(lists!=null){
			CompletedDTO dto = new CompletedDTO();
			Iterator<CompletedDTO> it = lists.iterator();
			while(it.hasNext()){
				
				dto = it.next();
				//System.out.println(dto.getImgNum()+":"+dto.getgNum());
				String img = getImage(dto.getImgNum());
				dto.setImgNum(img);
				System.out.println(dto.getImgNum()+":"+img);
			}
		}
		return lists;
	}
	public List<MainListDTO> imageForMlList (List<MainListDTO> lists){//MainList.action할때만 사용
		
		if(lists!=null){
			MainListDTO dto = new MainListDTO();
			Iterator<MainListDTO> it = lists.iterator();
			while(it.hasNext()){
				
				dto = it.next();
				String img = getImage(dto.getImgNum());
				dto.setImgNum(img);
				System.out.println(dto.getImgNum()+":"+img);
			}
		}
		return lists;
	}
	
	
}
