package com.kosta.project.dao;

import java.util.List;
import java.util.Map;

import com.kosta.project.dto.ProductJoinDto;

public interface ISearchDao {

	// 검색어에 해당하는 전체 검색 결과 갯수
	public int searchAllCount(String searchKeyword);
	
	// 페이지별_검색어에 해당하는 전체 검색 결과 
	public List<ProductJoinDto> searchAll_onePage(Map map);

}
