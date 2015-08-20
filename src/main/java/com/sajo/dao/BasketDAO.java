package com.sajo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.BasketDTO;
import com.sajo.dto.PurchaseDTO;


public class BasketDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
		
		
	}
	
<<<<<<< HEAD
	public void insertBK(BasketDTO dto){
		
		sessionTemplate.update("com.sajo.mapper.basket.updateData",dto);
	}
	
=======
	public int maxNum(){
		
		int maxNum = sessionTemplate.selectOne("com.sajo.mapper.basket.maxNum");
		
		return maxNum;
	}
	
	
	public int insertBK(BasketDTO dto){
		
		int result = 0;
		
		result = sessionTemplate.insert("com.sajo.mapper.basket.insertBK",dto);

		return result;
	}
	
	
	
>>>>>>> a429b6adedb5af7bc69f9744ebb2d8dfef29a513
	public List<BasketDTO> readPro(String mid){
		
		List<BasketDTO> lists = sessionTemplate.selectList("com.sajo.mapper.basket.readPro", mid);

		return lists;
		
	}
	
	public int getDataCount(String mid){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.mapper.basket.dataCount",mid);
		
		return result;
		
	}
	
	public void updateData(BasketDTO dto){
		
		sessionTemplate.update("com.sajo.mapper.basket.updatebk",dto);
	}
	
		
	public BasketDTO readbasket(int bnum){
		
		BasketDTO dto = sessionTemplate.selectOne("com.sajo.mapper.basket.readbasket",bnum);
		
		return dto;
		
	}
	
	public int delbasket(int bnum){
		
		int result = 0;
		result = sessionTemplate.delete("com.sajo.mapper.basket.delbasket", bnum);
		
		return result;
	}

}
