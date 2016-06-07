package com.kosta.project.dao;

import java.util.Date;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.project.dto.CartDTO;
import com.kosta.project.dto.CartJoinDTO;

public interface ICartDao {
	// 전체 장바구니 목록 출력
	public List<CartDTO> cartList(@Param("_id") String id);

	// 장바구니 insert
	public void insertCart(@Param("_f_no") String f_no, @Param("_id") String id, @Param("_reg_date") Date reg_date, 
			@Param("_f_total_price") int f_total_price, @Param("_f_total_count") int f_total_count);

	//레시피/테마인 경우, 조인해서 리스트 뽑아내기
	public List<CartJoinDTO> searchOnePage(@Param("_id") String id,@Param("_startRow") int startRow, @Param("_endRow") int endRow);

	public void deleteCart(@Param("_id") String id, @Param("_f_no") String f_no);
	
	//장바구니에 이미 담겨져 있는 상품인지 검색
	public List<CartDTO> findExist(@Param("_id") String id, @Param("_f_no") String f_no);
	
	//장바구니에 이미 담겨져 있을 경우, 클릭했을 때 상품 개수가 늘어남
	public void updateCart(@Param("_f_total_count") int f_total_count, @Param("_f_total_price") int f_total_price, @Param("_id") String id, @Param("_f_no") String f_no);
	
	//db에서 한 상품의 개수만 뽑아내기
	public int findTotalCount(@Param("_id") String id, @Param("_f_no") String f_no);
	
}
