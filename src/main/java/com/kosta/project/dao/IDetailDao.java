package com.kosta.project.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.kosta.project.dto.CheckOutDTO;
import com.kosta.project.dto.RTPdto;
import com.kosta.project.dto.RecipeReviewDTO;


public interface IDetailDao {
	public List<RTPdto> rtpList(@Param("_p_no") String p_no);
	
	//////////////리뷰부분////////////
	public List<RecipeReviewDTO> reviewList(@Param("_r_no") String r_no);
	
	public List<RecipeReviewDTO> searchOnePage(@Param("_r_no") String r_no, @Param("_startRow") int startRow, @Param("_endRow") int endRow);
	//리뷰 등록 부분
	public void insertReview(RecipeReviewDTO dto);
	
	//구매 테이블에 insert
	public void insertCheckOut(CheckOutDTO dto);
	
	//구매 테이블 delete
	public void deleteCheckOut(@Param("_c_no") String c_no, @Param("_id") String id);
}
