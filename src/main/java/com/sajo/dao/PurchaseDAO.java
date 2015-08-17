package com.sajo.dao;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import com.sajo.dto.PurchaseDTO;

public class PurchaseDAO {
	
	//dataSource D.I
	private SqlSessionTemplate sessionTemplate;
	//private Connection conn = null;
	

	public void setSessionTemplate(SqlSessionTemplate asd) throws Exception{
		this.sessionTemplate = asd;
	}
	
	
	
	//1.num
	public int getMaxNum(){
		
		int result = 0;
		
		result = sessionTemplate.selectOne("com.sajo.purchase.maxNum");
		
		return result;
	}
	
	//(created.jsp->created_ok.jsp)
	public int insertData(PurchaseDTO dto){
		
		int result=0;
		
		result = sessionTemplate.insert("com.sajo.purchase.insertData",dto);
		
		return result;
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
	
	
	//id로 구매테이블에서 모든 데이터 불러오기(취소시에 장바구니에 정보 입력하기
	
	public List<PurchaseDTO> getReadId(String mId){
		
		List<PurchaseDTO> lists = sessionTemplate.selectList("com.sajo.purchase.getLists",mId);
		
		return lists;
	}

	public int getDataCount(String searchValue){
		
		int result = 0;
		
		HashMap<String, Object> params = new HashMap<String, Object>();
		

		params.put("searchValue", searchValue);
		
		result = sessionTemplate.selectOne("com.sajo.purchase.getDataCount",params);

		return result;
	}
	
	/*bnum으로 데이터 읽어오기*/
	public PurchaseDTO getReadData(int num){
		
		PurchaseDTO dto = sessionTemplate.selectOne("com.sajo.purchase.getReadData",num);
		
		return dto;
	}
	
	//mid로 구매테이블에 있는 데이터 읽어오기
	public PurchaseDTO getReadbnums(String mid){
		
		PurchaseDTO dto = sessionTemplate.selectOne("com.sajo.purchase.getReadData",mid);
		
		return dto;
	}
	
	
	public PurchaseDTO getBnums(String mid){
		
		PurchaseDTO dto = sessionTemplate.selectOne("com.sajo.purchase.getBnums", mid);
		
		return dto;
		
	}
	
	//
	public void deleteData(int num){
		
		sessionTemplate.delete("com.sajo.purchase.deleteData",num);
	}
	
	
	//
	public void updateData(PurchaseDTO dto){
		
		sessionTemplate.update("com.sajo.purchase.updateData",dto);
	}
}


































