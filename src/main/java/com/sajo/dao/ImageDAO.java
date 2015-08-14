package com.sajo.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.ListIterator;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.sajo.dto.ImageDTO;


public class ImageDAO {
	
	private SqlSessionTemplate sessionTemplate;

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
    	
        String imageList = "";    //리턴할 imageNum 넣을곳.
        
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
    	 ListIterator<ImageDTO> it = lists.listIterator();

    	 for (String imgNO : imgNum) {              //그룹넘버 지정해서 한번에 검색도 가능
    		 
    		 it = sessionTemplate.selectOne("com.sajo.image.readData",imgNO);
    	 }
    	 
    	 return lists;
    }
    //=====================================================임시
}
