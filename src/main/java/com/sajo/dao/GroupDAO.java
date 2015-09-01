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
		
	//num�� �ִ밪
	public int getMaxNum(){
			
		int result = 0;
					
		result = sessionTemplate.selectOne("com.sajo.mapper.maxNum");
			
		return result;
			
	}
	
	
	//Group���� �������� �ѹ��� �̱�
	public int getGnoMaxNum(){
			
		int result = 0;
					
		result = sessionTemplate.selectOne("com.sajo.mapper.gnoMaxNum");
			
		return result;
			
	}
	
	//�Է�
	public void insertData(GroupDTO dto){
		
		sessionTemplate.insert("com.sajo.mapper.insertData",dto);	
		
	}
	
	//��ü������
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
	
	//��ü �����ͼ� ���ϱ�
	public int getDataCount(String searchKey,String searchValue){
				
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne("com.sajo.mapper.getDataCount",params);
						
		return result;
		
	}
	
	//��ȸ������
	public void updateHitCount(int gNum){
		
		sessionTemplate.update("com.sajo.mapper.updateHitCount",gNum);
		
	}
	
	//�Ѹ��� ������ ���
	public GroupDTO getReadData(int gNum){
		
		GroupDTO dto =		
				sessionTemplate.selectOne("com.sajo.mapper.getReadData",gNum);
		
		return dto;
		
	}
	
	//����
	public void deleteData(int gNum){
		
		sessionTemplate.delete("com.sajo.mapper.deleteData",gNum);
		sessionTemplate.delete("com.sajo.mapper.c_deleteData",gNum);
		
	}
	
	
	//����
	public void updateData(GroupDTO dto){
		
		sessionTemplate.update("com.sajo.mapper.updateData",dto);			
				
	}

	//�������� �׷� ������
	public GroupDTO g_getReadData(int gNo,String boardName){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("gNo", gNo);
		params.put("boardName", boardName);
		
		GroupDTO dto =		
				sessionTemplate.selectOne("com.sajo.mapper.g_getReadData",params);
						
		return dto;
		
	}
}
