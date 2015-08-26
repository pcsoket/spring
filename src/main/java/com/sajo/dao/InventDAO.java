package com.sajo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.GroupDTO;
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
	
	//전체데이터
		public List<GroupDTO> getList(int start, int end,
				String searchKey, String searchValue, int gNo,String boardName){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("start", start);
			params.put("end", end);
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			params.put("gNo", gNo);
			params.put("boardName",boardName);
			
			List<GroupDTO> lists = sessionTemplate.selectList("com.sajo.invent.getLists",params);
			
			return lists;
			
		}

}
