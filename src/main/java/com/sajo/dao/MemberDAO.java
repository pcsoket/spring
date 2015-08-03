package com.sajo.dao;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.MemberDTO;

public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public void insertData(MemberDTO dto){
		
		sessionTemplate.insert("com.sajo.member.sql.insertData", dto);
		
	}

}
