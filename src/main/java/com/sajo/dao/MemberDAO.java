package com.sajo.dao;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
public int getDataCount(String dong){
		

		HashMap<String, Object>params = new HashMap<String, Object>();
		
		params.put("dong", dong);
		
		int result =
				sessionTemplate.selectOne("com.sajo.member.sql.getDataCount",params);
		
		return result;
		
	}

	public MemberDTO idchk(String userId){
		
		MemberDTO dto = sessionTemplate.selectOne("com.sajo.member.sql.idchk", userId);
		
		return dto;
	}
	
	public MemberDTO getReadData(String userId){
		
		MemberDTO dto = sessionTemplate.selectOne("com.sajo.member.sql.getReadData", userId);
		
		return dto;
	}
	
	public void updated(MemberDTO dto){
		
		sessionTemplate.update("com.sajo.member.sql.memberUpdate", dto);
		
	}

}
