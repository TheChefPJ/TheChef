package com.kosta.project;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.project.dao.ISearchDao;
import com.kosta.project.dto.ProductJoinDto;

@Controller
public class SearchController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/search")
	public String search(HttpServletRequest request, Model model){
		System.out.println("search()");
		String searchKeyword = request.getParameter("searchKeyword");
		System.out.println("searchKeyword : "+searchKeyword);
		
		ISearchDao sdao = sqlSession.getMapper(ISearchDao.class);
		
		///페이징처리/////////////////////////////////////////////////////////
		int pageSize = 16;// 한페이지에 나오는 최대 데이터 갯수
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
		/////////////////////////////////////////////////////////////////////////////////
		
		allCount = sdao.searchAllCount(searchKeyword);//검색어에 해당하는 전체검색결과 갯수
		
		Map map = new HashMap<>(); // collection
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		map.put("searchKeyword", searchKeyword);
		
		List<ProductJoinDto> searchList = sdao.searchAll_onePage(map);//한페이지에 표시할 검색어에 해당하는 검색결과 갯수
		count = searchList.size();
		
		System.out.println("allCount : "+allCount);
		System.out.println("count : "+count);
		
		model.addAttribute("searchList",searchList);
		model.addAttribute("count", new Integer(count));
	    model.addAttribute("currentPage", new Integer(currentPage));
	    model.addAttribute("startRow", new Integer(startRow));
	    model.addAttribute("endRow", new Integer(endRow));
	    model.addAttribute("allCount", new Integer(allCount)); // 전체검색결과갯수
	    model.addAttribute("pageSize", new Integer(pageSize));
	    model.addAttribute("searchKeyword", searchKeyword);//검색어
		
		
		return "front.search.search";
	}
}
