package com.sajo.dao;


import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.ReportDTO;

public class ReportDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.report.maxNum");
		
		return result;
		
	}
	
	public void insertData(ReportDTO dto){
		
		sessionTemplate.insert("com.sajo.report.insertData",dto);
		
	}
	
public int getDataCount(){
		
		int result = sessionTemplate.selectOne("com.sajo.report.getDataCount");
		
		return result;
		
	}

public List<ReportDTO> getReadData(int start,int end){
	
	HashMap<String, Object> params = new HashMap<String, Object>();
	
	params.put("start",start);
	params.put("end",end);
	
	List<ReportDTO> lists = 
			sessionTemplate.selectList("com.sajo.report.getReadData",params);
	
	return lists;
			
		
	}

}
