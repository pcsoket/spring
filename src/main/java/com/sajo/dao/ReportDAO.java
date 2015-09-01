package com.sajo.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class ReportDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		
		this.sessionTemplate = sessionTemplate;
		
	}

}
