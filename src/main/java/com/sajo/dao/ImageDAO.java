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
	
	//============================================================�̹��� �迭 ���� �� insert
    public String writeFile(ImageDTO dto,String uploadPath) {
    	
 
		File dir = new File(uploadPath);//��ΰ� ������ ����
		if (!dir.exists()){
			dir.mkdirs();
		}
    	
        String imageList = "";    //������ imageNum ������.
        
        if (dto.getUpload() != null) {  //������ �ִٸ�
        
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
		        		idto.setUserId("111");               //�ӽ÷� �־��� ���߿� DTO�� �Ѿ�� �κ�
		        		
		        		
		        		if(!imageList.equals("")){                  //imgNum ,�����Ͽ� ��ġ��
		        		imageList+=","+idto.getImgNum();
		        		}else {
		        			imageList+=idto.getImgNum();	
						}
		        		
		        		
		        		idto.setUploadFileName("product"); //-----�������� �κ� ����
		        		idto.setOriginalFileName(multipartFile.getOriginalFilename());
		        		idto.setSaveFileName("11");  //�ӽ÷� �־���.
		        		idto.setTableName("test");  //�ӽ÷� �־���.
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
    
    public List<ImageDTO> getImageList(String imgnumlist) {   //�迭�� ���� �̹��� ���� ��������
    	
    	 String[] imgNum = imgnumlist.split(",");
    	 List<ImageDTO> lists = new ArrayList<ImageDTO>();
    	 ListIterator<ImageDTO> it = lists.listIterator();

    	 for (String imgNO : imgNum) {              //�׷�ѹ� �����ؼ� �ѹ��� �˻��� ����
    		 
    		 it = sessionTemplate.selectOne("com.sajo.image.readData",imgNO);
    	 }
    	 
    	 return lists;
    }
    //=====================================================�ӽ�
}
