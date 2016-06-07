package com.kosta.project.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.kosta.project.dto.RTPdto;

public interface IRTPdao {

   // 레시피/테마 상품등록 INSERT
   public void RTP_write(RTPdto dto);
   
   // 레시피/테마 상품삭제 delete
   public void RTP_delete(String p_no);
   
   // p_no에 해당하는 레시피/테마상품 선택
   // update할때도사용
   // 레시피/테마 상품삭제할때 실제 폴더에서 사진지우기 위해 사진파일명 뽑기
   public RTPdto RTP_selectAll(String p_no);
   
   // 레시피/테마 수정 update
   public void RTP_update(RTPdto dto);
   
   // 레시피 상품 리스트 SELECT ALL /
   public List<RTPdto> recipe_listAll();

   // 테마 상품 리스트 SELECT ALL / 레시피와는 정렬방식만 다름 데이터는 같음
   public List<RTPdto> theme_listAll();

   // 레시피 카테고리1별 상품 리스트
   public List<RTPdto> recipe_listCategory(String p_category1);

   // 테마 카테고리2별 상품 리스트
   public List<RTPdto> theme_listCategory(String p_category2);

   // 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ recipe전체
   public List<RTPdto> recipe_onePageList(@Param("_startRow") int startRow, @Param("_endRow")int endRow);
      
   // 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ recipe카테고리별
   public List<RTPdto> recipe_onePageListCategory(@Param("_p_category1") String p_category1, @Param("_startRow") int startRow, @Param("_endRow") int endRow);
   
   // 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ theme전체
   public List<RTPdto> theme_onePageList(@Param("_startRow") int startRow, @Param("_endRow")int endRow);
         
   // 페이징처리 위해 해당 페이지에 출력될 내용 뽑기 _ theme카테고리별
   public List<RTPdto> theme_onePageListCategory(@Param("_p_category2") String p_category2, @Param("_startRow") int startRow, @Param("_endRow") int endRow);
   
   // 레시피 테마 테이블 전체 데이터 갯수
   public int RTP_countAll();
}