package com.sajo.dao;

import java.util.HashMap;
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
	
	public void updategno(int gNo,String userId){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("gNo", gNo);
		params.put("userId", userId);
		
		sessionTemplate.update("com.sajo.mapper.updategno",params);
		
	}
	
	public void deleteData(String userId){
		
		sessionTemplate.delete("com.sajo.member.sql.deleteData",userId);
		
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
	
	public void gnoUpdate(int gno,String userId){
		
		HashMap<String, Object>params = new HashMap<String, Object>();
		
		params.put("gno", gno);
		params.put("userId", userId);
		
		sessionTemplate.update("com.sajo.member.sql.gnoUpdate", params);
		
	}
	
public List<MemberDTO> getTotalReadData(int start,int end,String searchKey,String searchValue){
		
	HashMap<String, Object> params = new HashMap<String, Object>();
	
	params.put("start",start);
	params.put("end",end);
	params.put("searchKey",searchKey);
	params.put("searchValue",searchValue);
	
	List<MemberDTO> lists = 
			sessionTemplate.selectList("com.sajo.member.sql.getTotalReadData",params);
	
	return lists;
			
		
	}

	public int getmaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.member.sql.maxNum");
		
		return result;
		
	}
	
	public int getListDataCount(String searchKey,String searchValue){
		

		HashMap<String, Object>params = new HashMap<String, Object>();
		
		params.put("searchKey", searchKey);
		params.put("searchValue", searchValue);
		
		int result = sessionTemplate.selectOne("com.sajo.member.sql.getListDataCount", params);
		
		return result;
		
	}
	
	public void insertGno(String userId,int gno){
		
		HashMap<String, Object>params = new HashMap<String, Object>();
		
		params.put("userId", userId);
		params.put("gno", gno);
		
		sessionTemplate.insert("com.sajo.member.sql.insertGno", params);
		
	}
	
public void deleteGno(String userId){		
		
		sessionTemplate.insert("com.sajo.member.sql.deleteGno", userId);
		
	}

}
