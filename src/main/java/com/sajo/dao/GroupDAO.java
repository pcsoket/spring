package com.sajo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.GroupDTO;

public class GroupDAO {
	
	private SqlSessionTemplate sessionTemplate;
		
		public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
			this.sessionTemplate = sessionTemplate;		
		}
		
	//num의 최대값
	public int getMaxNum(){
			
		int result = 0;
					
		result = sessionTemplate.selectOne("com.sajo.mapper.maxNum");
			
		return result;
			
	}
	
	
	//Group으로 묶기위한 넘버를 뽑기
	public int getGnoMaxNum(){
			
		int result = 0;
					
		result = sessionTemplate.selectOne("com.sajo.mapper.gnoMaxNum");
			
		return result;
			
	}
	
	//입력
	public void insertData(GroupDTO dto){
		
		sessionTemplate.insert("com.sajo.mapper.insertData",dto);	
		
	}
	
	//전체데이터
	public List<GroupDTO> getList(int start, int end,
			String searchKey, String searchValue,String boardName){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		params.put("boardName", boardName);
		
		List<GroupDTO> lists = sessionTemplate.selectList("com.sajo.mapper.getLists",params);
		
		return lists;
		
	}
	
	//전체 데이터수 구하기
	public int getDataCount(String searchKey,String searchValue){
				
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne("com.sajo.mapper.getDataCount",params);
						
		return result;
		
	}
	
	//조회수증가
	public void updateHitCount(int gNum){
		
		sessionTemplate.update("com.sajo.mapper.updateHitCount",gNum);
		
	}
	
	//한명의 데이터 출력
	public GroupDTO getReadData(int gNum){
		
		GroupDTO dto =		
				sessionTemplate.selectOne("com.sajo.mapper.getReadData",gNum);
		
		return dto;
		
	}
	
	//삭제
	public void deleteData(int gNum){
		
		sessionTemplate.delete("com.sajo.mapper.deleteData",gNum);
		sessionTemplate.delete("com.sajo.mapper.c_deleteData",gNum);
		
	}
	
	
	//수정
	public void updateData(GroupDTO dto){
		
		sessionTemplate.update("com.sajo.mapper.updateData",dto);			
				
	}

	//참여중인 그룹 데이터
	public GroupDTO g_getReadData(int gNo,String boardName){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("gNo", gNo);
		params.put("boardName", boardName);
		
		GroupDTO dto =		
				sessionTemplate.selectOne("com.sajo.mapper.g_getReadData",params);
						
		return dto;
		
	}
}
