package com.sajo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.LoginDTO;

public class LoginDAO {
	
	private SqlSessionTemplate sessionTemplate;
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public LoginDTO getList(String userId){
		
		LoginDTO dto =
				sessionTemplate.selectOne("com.sajo.login.sql.getList",userId);
		
		return dto;
	}

}
