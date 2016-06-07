package com.kosta.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kosta.project.dto.FarmProductDto;
import com.kosta.project.dto.RTPdto;

public interface IFarmProductDao {

	// 골라담기 상품 insert
	public void farmProduct_write(FarmProductDto dto);

	// 골라담기 상품 전체 출력 select
	public List<FarmProductDto> farmProduct_list();

	// 골라담기 상품 카테고리별 출력 select
	public List<FarmProductDto> farmProduct_listCategory(String s_category);

	//s_no에 해당하는 골라담기 상품 delete
	public void farmProduct_delete(String s_no);
	
	//s_no에 해당하는 골라담기 상품 select
	public FarmProductDto farmProduct_selectAll(String s_no);
	
	// 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ 전체
	public List<FarmProductDto> farmProduct_onePageList(@Param("_startRow") int startRow, @Param("_endRow")int endRow);
			
	// 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ 카테고리별
	public List<FarmProductDto> farmProduct_onePageListCategory(@Param("_s_category") String s_category, @Param("_startRow") int startRow, @Param("_endRow") int endRow);
	
	// 골라담기 테이블 전체 데이터 갯수
	public int farmProduct_countAll();
	
	// 골라담기 수정 update
	public void farmProduct_update(FarmProductDto dto);
}
