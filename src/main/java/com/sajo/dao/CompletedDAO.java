package com.sajo.dao;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

import com.sajo.dto.CompletedDTO;
import com.sajo.dto.ProductDTO;

public class CompletedDAO {
	
	private SqlSessionTemplate sessionTemplate;
	
	public void setSessionTemplate(SqlSessionTemplate sessionTemplate) throws Exception{
		this.sessionTemplate = sessionTemplate;		
	}
	
	//num�� �ִ밪
		public int cp_maxNum(){
				
			int result = 0;
						
			result = sessionTemplate.selectOne("com.sajo.completed.maxNum");
				
			return result;
				
		}
		
		
		public List<CompletedDTO> getbest() {
			
			List<CompletedDTO> lists = sessionTemplate.selectList("com.sajo.completed.getbest");
			
			return lists;
			
		}
		

		
	//��ü������
		public List<CompletedDTO> cp_getList(int start, int end,
				String searchKey, String searchValue){
			
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			
			params.put("start", start);
			params.put("end", end);
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			
			List<CompletedDTO> lists = sessionTemplate.selectList("com.sajo.completed.p_getLists",params);
			
			return lists;
			
		}
		
		
	
		
	
		
		//��ü �����ͼ� ���ϱ�
		public int cp_getDataCount(String searchKey,String searchValue){
					
			HashMap<String, Object> params = new HashMap<String, Object>();
			
			params.put("searchKey", searchKey);
			params.put("searchValue", searchValue);
			
			
			int result = sessionTemplate.selectOne("com.sajo.completed.getDataCount",params);
							
			return result;
			
		}
		
		//��ȸ������
		public void p_updateHitCount(int pNum){
			
			sessionTemplate.update("com.sajo.completed.p_updateHitCount",pNum);
			
		}
		
		//�Ѹ��� ������ ���
		public CompletedDTO p_getReadData(int pNum){
			
			CompletedDTO dto =		
					sessionTemplate.selectOne("com.sajo.completed.p_getReadData",pNum);
			
			return dto;
			
		}
		
		//ī�װ� ������ ���
		public List<CompletedDTO> p_getListsCategory(int start, int end, String pCategory){
			
			
			Map<String, Object> hMap = new HashMap<String, Object>();
					
			hMap.put("pCategory", pCategory);
			hMap.put("start", start);
			hMap.put("end", end);
			
			List<CompletedDTO> categorylists = 		
					sessionTemplate.selectList("com.sajo.completed.p_getListsCategory",hMap);
			
			return categorylists;

		}
		
		//��ȸ�� ������ ���
		public List<CompletedDTO> p_getListsHitCount(int start, int end){
					
					
			Map<String, Object> hMap = new HashMap<String, Object>();
							
			hMap.put("start", start);
			hMap.put("end", 4);
					
				List<CompletedDTO> hitcountlists = 		
					sessionTemplate.selectList("com.sajo.completed.p_getListsHitCount",hMap);
					
				return hitcountlists;

				
		}
		

		//���̵���ǰ ��ȸ�� ������ ���
		public List<CompletedDTO> p_getListsIdeaHitCount(int start, int end,String pCategory){
							
							
			Map<String, Object> hMap = new HashMap<String, Object>();
									
			hMap.put("start", start);
			hMap.put("end", 4);
			hMap.put("pCategory", pCategory);
							
			List<CompletedDTO> ideahitcountlists = 		
					sessionTemplate.selectList("com.sajo.completed.p_getListsIdeaHitCount",hMap);
							
				return ideahitcountlists;

						
				}
		
		
		//��ǿ�ǰ�� ��ȸ�� ������ ���
				public List<CompletedDTO> p_getListsIdeaCategory(int start, int end,String pCategory){
									
									
					Map<String, Object> hMap = new HashMap<String, Object>();
											
					hMap.put("start", start);
					hMap.put("end", end);
					hMap.put("pCategory", pCategory);
									
					List<CompletedDTO> idea_categorylists = 		
							sessionTemplate.selectList("com.sajo.completed.p_getListsIdeaCategory",hMap);
									
						return idea_categorylists;

								
						}
				
				
		
		//��õ�� ������ ���
		public List<CompletedDTO> p_getListsGrade(int start, int end){
							
							
			Map<String, Object> hMap = new HashMap<String, Object>();
									
			hMap.put("start", start);
			hMap.put("end", 4);
							
			List<CompletedDTO> recommandlists = 		
					sessionTemplate.selectList("com.sajo.completed.p_getListsGrade",hMap);
							
				return recommandlists;

						
		}
						
				
		
		
		
		
		//��ǰ insertData
		public void p_insertData(CompletedDTO dto){
			
			sessionTemplate.insert("com.sajo.god.product.mapper.p_insertData",dto);
		}

		
				
		
		

	

}
