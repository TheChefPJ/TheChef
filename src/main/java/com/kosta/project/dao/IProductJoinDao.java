package com.kosta.project.dao;

import java.util.List;
import java.util.Map;

import com.kosta.project.dto.ProductJoinDto;

public interface IProductJoinDao {
	//상품조회수정 전체검색
	public List<ProductJoinDto> searchDetailJoin(Map map);
	//상품조회수정 레시피테마 검색
	public List<ProductJoinDto> searchDetailRTP(Map map);
	//상품조회수정 골라담기 검색
	public List<ProductJoinDto> searchDetailFarm(Map map);
	
	// 페이징 상품조회수정 레시피검색
	public List<ProductJoinDto> onePage_searchDetailRTP(Map map);	
	//페이징 상품조회수정 골라담기검색
	public List<ProductJoinDto> onePage_searchDetailFarm(Map map);
	//페이징 상품조회수정 전체검색
	public List<ProductJoinDto> onePage_searchDetailJoin(Map map);
	
}
