package com.sajo.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.CommentDTO;

public class CommentDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;		
	}
	
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.comment.maxNum");
		
		return result;
		
	}
	
	public void insertData(CommentDTO dto){
		
		sessionTemplate.insert("com.sajo.comment.insertData",dto);
		
	}
	
	public List<CommentDTO> getList(int start, int end, int gNum){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("gNum", gNum);
				
		List<CommentDTO> lists = sessionTemplate.selectList("com.sajo.comment.getLists",params);
		
		return lists;
		
	}
	
	//��ü �����ͼ� ���ϱ�
	public int getDataCount(int gNum){

		int result = sessionTemplate.selectOne("com.sajo.comment.getDataCount",gNum);

		return result;

	}
	
	//�Ѹ��� ������ ���
	public CommentDTO getReadData(int gNum){
		
		CommentDTO dto =		
				sessionTemplate.selectOne("com.sajo.comment.getReadData",gNum);
		
		return dto;
		
	}
	
	//����
	public void deleteData(int gNum){
		
		sessionTemplate.delete("com.sajo.comment.deleteData",gNum);	
		
	}
	
	
	//����
	public void updateData(CommentDTO dto){
		
		sessionTemplate.update("com.sajo.comment.updateData",dto);			
				
	}
	
	public void update_recomm(int cmNum){
		
		sessionTemplate.update("com.sajo.comment.updaterecomm",cmNum);			
				
	}

}