package com.sajo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.CompletedDTO;
import com.sajo.dto.GroupDTO;


public class CompletedDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
		
		
	}
	
	//��ü������
		public List<CompletedDTO> getbest() {
			
			List<CompletedDTO> lists = sessionTemplate.selectList("com.sajo.completed.getbest");
			
			return lists;
			
		}

}
