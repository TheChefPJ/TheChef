package com.kosta.project.dao;

import java.util.HashMap;
import java.util.List;

import com.kosta.project.dto.FrequentQuestionDTO;

public interface ICustomerCenterDao {
		//목록보기
		public List<FrequentQuestionDTO> list(HashMap<String, Object> map);
		//게시글 갯수받아오기
		public int getListCount();
		
		//카테고리로 목록가져올때
		public List<FrequentQuestionDTO> listbycategory(HashMap<String, Object> map);
		public int getListCount2(HashMap<String, Object> map);
		
		public void write(FrequentQuestionDTO dto);
}
