package com.sajo.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;


import com.sajo.dto.ProductDTO;

public class ProductDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;		
	}
	
	//num의 최대값
		public int p_maxNum(){
				
			int result = 0;
						
			result = sessionTemplate.selectOne("com.sajo.god.product.mapper.p_maxNum");
				
			return result;
				
		}
		

		
	//전체데이터
		public List<ProductDTO> p_getList(int start, int end,
				String searchKey, String searchValue){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			
			params.put("start", start);
			params.put("end", end);
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			
			List<ProductDTO> lists = sessionTemplate.selectList("com.sajo.god.product.mapper.p_getLists",params);
			
			return lists;
			
		}
		
		
	
		
	
		
		//전체 데이터수 구하기
		public int p_getDataCount(String searchKey,String searchValue){
					
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			
			int result = sessionTemplate.selectOne("com.sajo.god.product.mapper.p_getDataCount",params);
							
			return result;
			
		}
		
		//조회수증가
		public void p_updateHitCount(int pNum){
			
			sessionTemplate.update("com.sajo.god.product.mapper.p_updateHitCount",pNum);
			
		}
		
		//한명의 데이터 출력
		public ProductDTO p_getReadData(int pNum){
			
			ProductDTO dto =		
					sessionTemplate.selectOne("com.sajo.god.product.mapper.p_getReadData",pNum);
			
			return dto;
			
		}
		
		public List<ProductDTO> p_getListsCategory(int start, int end, String pCategory){
			
			
			Map<String, Object> hMap = new HashMap<String, Object>();
					
			hMap.put("pCategory", pCategory);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<ProductDTO> categorylists = 		
					sessionTemplate.selectList("com.sajo.god.product.mapper.p_getListsCategory",hMap);
			
			return categorylists;
			
			
	
			
		}
		
		
		
		
				
		
		

	

}
