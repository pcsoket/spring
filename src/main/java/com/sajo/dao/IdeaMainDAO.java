package com.sajo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.MainListDTO;



public class IdeaMainDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
	}
	
	public MainListDTO getData(String userId,String boardName){
		
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		
		hMap.put("userId",userId);
		hMap.put("boardName",boardName);
		
		MainListDTO dto = sessionTemplate.selectOne("com.sajo.ideamainlist.getData",hMap);
		
		return dto;
	}
	
	public List<MainListDTO> getIdeaReadData(){
		
		String boardName="group";
		
		List<MainListDTO> lists = sessionTemplate.selectList("com.sajo.ideamainlist.getIdeaReadData",boardName);
		
		return lists;
		
	}

}
