package com.sajo.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.AddrDTO;
import com.sajo.dto.MemberDTO;

public class MemberDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate){
		
		this.sessionTemplate = sessionTemplate;
		
	}
	
	public void insertData(MemberDTO dto){
		
		sessionTemplate.insert("com.sajo.member.sql.insertData", dto);
		
	}
	
	public void deleteData(String mid){
		
		sessionTemplate.delete("com.sajo.member.sql.deleteData",mid);
		
	}
	
	public List<AddrDTO> getAddrList(String dong){
		
		List<AddrDTO> lists = 
		sessionTemplate.selectList("com.sajo.member.sql.getAddrList", dong);
		
		return lists;
		
	}

}
