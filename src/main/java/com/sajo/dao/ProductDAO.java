package com.sajo.dao;


//import java.util.ArrayList;
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
		public int p_getDataCount(String searchKey,String searchValue,String pCategory){
					
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			params.put("pCategory", pCategory);
			
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
		
		//카테고리 데이터 출력
		public List<ProductDTO> p_getListsCategory(int start, int end, String pCategory){
			
			
			Map<String, Object> hMap = new HashMap<String, Object>();
					
			hMap.put("pCategory", pCategory);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<ProductDTO> categorylists = 		
					sessionTemplate.selectList("com.sajo.god.product.mapper.p_getListsCategory",hMap);
			
			return categorylists;

		}
		
		//조회수 데이터 출력
		public List<ProductDTO> p_getListsHitCount(int start, int end){
					
					
			Map<String, Object> hMap = new HashMap<String, Object>();
							
			hMap.put("start", start);
			hMap.put("end", 4);
					
				List<ProductDTO> hitcountlists = 		
					sessionTemplate.selectList("com.sajo.god.product.mapper.p_getListsHitCount",hMap);
					
				return hitcountlists;

				
		}
		

		//아이디어상품 조회수 데이터 출력
		public List<ProductDTO> p_getListsIdeaHitCount(int start, int end,String pCategory){
							
							
			Map<String, Object> hMap = new HashMap<String, Object>();
									
			hMap.put("start", start);
			hMap.put("end", 4);
			hMap.put("pCategory", pCategory);
							
			List<ProductDTO> ideahitcountlists = 		
					sessionTemplate.selectList("com.sajo.god.product.mapper.p_getListsIdeaHitCount",hMap);
							
				return ideahitcountlists;

						
				}
		
		
		//욕실용품ㅎ 조회수 데이터 출력
				public List<ProductDTO> p_getListsIdeaCategory(int start, int end,String pCategory){
									
									
					Map<String, Object> hMap = new HashMap<String, Object>();
											
					hMap.put("start", start);
					hMap.put("end", end);
					hMap.put("pCategory", pCategory);
									
					List<ProductDTO> idea_categorylists = 		
							sessionTemplate.selectList("com.sajo.god.product.mapper.p_getListsIdeaCategory",hMap);
									
						return idea_categorylists;

								
						}
				
				
		
		//추천순 데이터 출력
		public List<ProductDTO> p_getListsGrade(int start, int end){
							
							
			Map<String, Object> hMap = new HashMap<String, Object>();
									
			hMap.put("start", start);
			hMap.put("end", 4);
							
			List<ProductDTO> recommandlists = 		
					sessionTemplate.selectList("com.sajo.god.product.mapper.p_getListsGrade",hMap);
							
				return recommandlists;

						
		}
		
		//상품 insertData
		public void p_insertData(ProductDTO dto){
			
			sessionTemplate.insert("com.sajo.god.product.mapper.p_insertData",dto);
		}

		
				
		
		

	

}
