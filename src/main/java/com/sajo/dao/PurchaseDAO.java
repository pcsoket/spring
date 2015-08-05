package com.sajo.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.sql.DataSource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import com.sajo.dto.PurchaseDTO;

public class PurchaseDAO {
	
	//dataSource D.I
	private SqlSessionTemplate sessionTemplate;
	private Connection conn = null;
	

	public void setSessionT(SqlSessionTemplate asd) throws Exception{
		this.sessionTemplate = asd;
	}
	
	
	
	//1.num
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.purchase.maxNum");
		
		return result;
	}
	
	//(created.jsp->created_ok.jsp)
	public void insertData(PurchaseDTO dto){
		
		sessionTemplate.insert("com.sajo.purchase.insertData",dto);
	}
	

	public List<PurchaseDTO> getList(int start, int end, String searchValue,String userId){
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		
		params.put("start", start);
		params.put("end", end);
		params.put("searchValue", searchValue);
		params.put("userId", userId);
		
		List<PurchaseDTO> lists = sessionTemplate.selectList("com.sajo.purchase.getLists",params);
		
		return lists;
	}
	
	public int getDataCount(String searchValue){
		
		int result = 0;
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		

		params.put("searchValue", searchValue);
		
		result = sessionTemplate.selectOne("com.sajo.purchase.getDataCount",params);

		return result;
	}
	
	public PurchaseDTO getReadData(int num){
		
		PurchaseDTO dto = sessionTemplate.selectOne("com.sajo.purchase.getReadData",num);
		
		return dto;
	}
	
	//
	public void deleteData(int num){
		
		sessionTemplate.delete("com.sajo.purchase.deleteData");
	}
	
	
	//
	public void updateData(PurchaseDTO dto){
		
		sessionTemplate.update("com.sajo.purchase.updateData",dto);
	}
}


































