package com.sajo.dao;

import java.util.HashMap;


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
	
public LoginDTO getListId(String userName,String userEmail){
		
	HashMap<String, Object> hMap = new HashMap<String, Object>();
	
	hMap.put("userName", userName);
	hMap.put("userEmail", userEmail);
	
	
		LoginDTO dto =
				sessionTemplate.selectOne("com.sajo.login.sql.getListId",hMap);
		
		return dto;
	}

}
