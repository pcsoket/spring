package com.sajo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.BasketDTO;

public class BasketDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
		
		
	}
	
	public List<BasketDTO> readPro(int pnum){
		
		List<BasketDTO> lists = sessionTemplate.selectList("com.sajo.mapper.basket.readPro", pnum);

		return lists;
		
	}
	
	public int getDataCount(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.mapper.basket.dataCount");
		
		return result;
		
	}

}