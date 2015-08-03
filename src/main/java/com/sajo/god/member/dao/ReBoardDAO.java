package com.sajo.god.member.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.god.member.dto.ReBoardDTO;

public class ReBoardDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;		
	}
	
	//num�� �ִ밪
	public int num_Max(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.god.member.mapper.num_Max");
		
		return result;
		
	}
	
	//�Է�
	public void insert_Data(ReBoardDTO dto){
		
		sessionTemplate.insert("com.sajo.god.member.mapper.insert_Data", dto);
		
	}
	
	//��ü������
	public List<ReBoardDTO> list_Data(int start, int end,
			String searchKey, String searchValue){
			
		HashMap<String, Object> params = new HashMap<String, Object>();
			
		params.put("start", start);
		params.put("end", end);
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
			
		List<ReBoardDTO> lists = sessionTemplate.selectList("com.sajo.god.member.mapper.list_Data",params);
			
		return lists;
			
	}
	
	//��ü �����ͼ� ���ϱ�
	public int data_Count(String searchKey,String searchValue){
					
		HashMap<String, Object> params = new HashMap<String, Object>();
			
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne("com.sajo.god.member.mapper.data_Count",params);
							
		return result;
			
	}
	
	//����
	public void delete_Data(int num){
			
		sessionTemplate.delete("com.sajo.god.member.mapper.delete_Data",num);	
			
	}

}