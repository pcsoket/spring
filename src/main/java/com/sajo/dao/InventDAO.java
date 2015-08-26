package com.sajo.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.InventDTO;

public class InventDAO {

	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) {
		this.sessionTemplate = sessionTemplate;
	}
	
	public int getGno (int gNum){
		
		int gno = sessionTemplate.selectOne("com.sajo.invent.getGno", gNum);
		
		System.out.println(gno);
		
		return gno;
		
	}
	
	public InventDTO getInventData (int gNo){
		
		InventDTO dto = sessionTemplate.selectOne("com.sajo.invent.getInventData", gNo);
		
		return dto;
	}
	
	public InventDTO get3dData (int gNo){
		
		InventDTO dto = sessionTemplate.selectOne("com.sajo.invent.getModelData", gNo);
		
		return dto;
	}
	
	public InventDTO getSketchData (int gNo){
		
		InventDTO dto = sessionTemplate.selectOne("com.sajo.invent.getSketchData", gNo);
		
		return dto;
	}

}
