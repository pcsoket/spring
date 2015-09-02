package com.sajo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.ContributionDTO;

public class ContributionDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;		
	}
	
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.contribution.maxNum");
		
		return result;
		
	}
	
	public void insertData(ContributionDTO dto){
		
		sessionTemplate.insert("com.sajo.contribution.insertData",dto);
		
	}
	

	public void updateContribution(int gNum){
		System.out.println(gNum + "contributionUpdate");
		sessionTemplate.update("com.sajo.contribution.updateContribution",gNum);			
				
	}
	
	public int printContribution(int gNum){
		
		int result = 0;
		
		result =sessionTemplate.selectOne("com.sajo.contribution.printContribution",gNum);			
		
		return result;
				
	}
	
	public int checkContribution(ContributionDTO dto){
		
		int result = 1;
		if(sessionTemplate.selectOne("com.sajo.contribution.checkContribution",dto)==null){
			result=0;
			return result;
		}				
		
		return result;				
	}
	
	public int myContribution(String userId){
		
		int result = 0;
		
		result =sessionTemplate.selectOne("com.sajo.contribution.myContribution",userId);			
		
		return result;
				
	}
	
	public List<ContributionDTO> getContributionList(int gNo){
		
		List<ContributionDTO> lists =sessionTemplate.selectOne("com.sajo.contribution.getContributionList",gNo);			
		
		return lists;
	}
}