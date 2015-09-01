package com.sajo.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.ContributionDTO;

public class ContributionDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;		
	}
	
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.contributin.maxNum");
		
		return result;
		
	}
	
	public void insertData(ContributionDTO dto){
		
		sessionTemplate.insert("com.sajo.contribution.insertData",dto);
		
	}
	

	public void updateContribution(int gNum){
		
		sessionTemplate.update("com.sajo.contribution.updateContribution",gNum);			
				
	}
	
	public void checkContribution(int gNum){
		
		sessionTemplate.update("com.sajo.contribution.checkContribution",gNum);			
				
	}


}