package com.sajo.dao;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
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
	        	ImageDTO idto = null;
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
		        		imageList+=idto.getImgNum()+"!@#$";  //문제의 여지가 있음.
		        		idto.setUploadFileName("product"); //-----아직쓰는 부분 없음
		        		idto.setOriginalFileName(multipartFile.getOriginalFilename());
		        		insertData(idto);
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
	
}
