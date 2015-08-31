package com.sajo.dao;

import org.mybatis.spring.SqlSessionTemplate;

public class CompletedDAO {
	
private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;
		
		
	}

}
