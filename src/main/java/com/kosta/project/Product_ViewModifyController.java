package com.kosta.project;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.project.dao.IFarmProductDao;
import com.kosta.project.dao.IProductJoinDao;
import com.kosta.project.dao.IRTPdao;
import com.kosta.project.dto.ProductJoinDto;

@Controller
public class Product_ViewModifyController {

	@Autowired
	private SqlSession sqlSession;
	
	// 상품조회수정페이지
	@RequestMapping(value = "/productSelect_Modify")
	public String productSelect_Modify(Locale locale, Model model, HttpServletRequest request) {
		System.out.println("productSelect_Modify()");

		// recipe_theme_Products 테이블 count
		IRTPdao dao = sqlSession.getMapper(IRTPdao.class);
		int rtpCountAll = dao.RTP_countAll();
		model.addAttribute("rtpCountAll", new Integer(rtpCountAll));
		// farmProducts 테이블 count
		IFarmProductDao daof = sqlSession.getMapper(IFarmProductDao.class);
		int farmProductCountAll = daof.farmProduct_countAll();
		model.addAttribute("farmProductCountAll", new Integer(farmProductCountAll));
		
		IProductJoinDao daop = sqlSession.getMapper(IProductJoinDao.class);
		
		///////////////////////////////////////////////////////////////////////////
		String tableName = request.getParameter("searchRange");
		// 전체검색 : rangeAll, 레시피테마 : recipe_theme_Products, 골라담기 : farm_Products

		String searchNo = request.getParameter("searchNo");
		String searchTitle = request.getParameter("searchTitle");
		String searchWriter = request.getParameter("searchWriter");
		String searchCategory = request.getParameter("searchCategory");
		// 상품코드 : searchNo, 상품명 : searchTitle, 작성자ID : searchWriter, 카테고리 :
		// searchCategory
		String searchKeyword = request.getParameter("searchKeyword");
		// 검색한 키워드

		String startRegdate = request.getParameter("startRegdate");
		String endRegdate = request.getParameter("endRegdate");
		///////////////////////////////////////////////////////////값유지하기위한...
		model.addAttribute("searchRange",tableName);
		model.addAttribute("searchNo",searchNo);
		model.addAttribute("searchTitle",searchTitle);
		model.addAttribute("searchWriter",searchWriter);
		model.addAttribute("searchCategory",searchCategory);
		model.addAttribute("searchKeyword",searchKeyword);
		model.addAttribute("startRegdate",startRegdate);
		model.addAttribute("endRegdate",endRegdate);
		
		//////////////////////////////////////////////////////////////////////////
		System.out.println(tableName);
		System.out.println(
				searchNo + "-" + searchTitle + "-" + searchWriter + "-" + searchCategory + "-" + searchKeyword);
		System.out.println(startRegdate);
		System.out.println(endRegdate);

		///페이징처리/////////////////////////////////////////////////////////
		List<ProductJoinDto> searchList = new ArrayList<ProductJoinDto>();
		List<ProductJoinDto> search_onePageList = new ArrayList<ProductJoinDto>();
		
		int pageSize = 15;// 한페이지에 나오는 최대 데이터 갯수
		int allCount = 0; // 선택한 데이터 총 갯수
		int count = 0;//선택된 한페이지에 있는 데이터 총 갯수
		String pageNum = request.getParameter("pageNum"); // 페이지번호
		 //기본값 1로 get방식으로 받음
		if (pageNum == null) { // null인경우 1로 지정
	         pageNum = "1";
	    }
		int currentPage = Integer.parseInt(pageNum); // currentPage : 현재 보고 있는 페이지
		int startRow = (currentPage * pageSize) - (pageSize-1); // 현재페이지의 시작행
	    int endRow = currentPage * pageSize; // 현재페이지의 끝행
	    
	    
		System.out.println("pageNum : " + pageNum);
		System.out.println("currentPage : " + currentPage);
		System.out.println("startRow : " + startRow);
		System.out.println("endRow : " + endRow);

		//////////////////////////////////////////////////////////////////////////
		Map map = new HashMap<>(); // collection
		map.put("searchNo", searchNo);
		map.put("searchTitle", searchTitle);
		map.put("searchWriter", searchWriter);
		map.put("searchCategory", searchCategory);
		map.put("searchKeyword", searchKeyword);
		map.put("startRegdate", startRegdate);
		map.put("endRegdate", endRegdate);
		map.put("startRow", startRow);
		map.put("endRow", endRow);

		/////////////////////////////////////////////////////////////////////////
		if (tableName != null) {
			if (tableName.equals("recipe_theme_Products")) {
				// 레시피테마 검색
				searchList = daop.searchDetailRTP(map);
				search_onePageList = daop.onePage_searchDetailRTP(map);

			} else if (tableName.equals("farm_Products")) {
				// 골라담기 검색
				searchList = daop.searchDetailFarm(map);
				search_onePageList = daop.onePage_searchDetailFarm(map);

			} else if (tableName.equals("rangeAll")) {
				// 전체검색 : 레시피테마+골라담기
				searchList = daop.searchDetailJoin(map);
				search_onePageList = daop.onePage_searchDetailJoin(map);
			}
			
		}
		allCount = searchList.size();
		count = search_onePageList.size();
		
		System.out.println("allCount : "+allCount);
		System.out.println("count : "+count);
		
		model.addAttribute("searchList",searchList);
		model.addAttribute("count", new Integer(count));
	    model.addAttribute("currentPage", new Integer(currentPage));
	    model.addAttribute("startRow", new Integer(startRow));
	    model.addAttribute("endRow", new Integer(endRow));
	    model.addAttribute("allCount", new Integer(allCount));
	    model.addAttribute("pageSize", new Integer(pageSize));
	    model.addAttribute("searchList",searchList); // 해당하는 전체리스트
	    model.addAttribute("search_onePageList",search_onePageList); // 한페이지에 출력될 리스트
	    
		return "back.storeManage.productSelect_Modify";
	}

}
