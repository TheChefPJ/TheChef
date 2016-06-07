package com.kosta.project;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.project.dao.ICustomerCenterDao;
import com.kosta.project.dto.FrequentQuestionDTO;

@Controller
public class CustomerCenterController {

	@Autowired
	private SqlSession sqlSession;
	
	@RequestMapping("/FQ_list")
	public String list(HttpServletRequest request, Model model){
		
		int pg = 1;
		String strPg = request.getParameter("pg");
		if (strPg != null) {
			pg = Integer.parseInt(strPg);
		}
		int rowSize = 10;
		int start = (pg * rowSize) - (rowSize - 1);
		int end = pg * rowSize;

		ICustomerCenterDao dao = sqlSession.getMapper(ICustomerCenterDao.class);
		HashMap<String, Object> map = new HashMap<String, Object>();
			
		
		int total = 0; // 총 게시물수

		//category 받아와 판별함
		String determinant = request.getParameter("category");
		map.put("det", determinant);
		if(determinant == null){
			System.out.println("determinant=null");
			total = dao.getListCount();
			
		}
		
		if(determinant != null){
			System.out.println("determinant="+determinant);
			total = dao.getListCount2(map);
			System.out.println("이거실행되나?");
		}
		
		
		int allPage = (int) Math.ceil(total / (double) rowSize); // 페이지수
		// int totalPage = total/rowSize + (total%rowSize==0?0:1);

		int block = 5; // 한페이지에 보여줄 범위 << [1] [2] [3] [4] [5] >>
		int fromPage = ((pg - 1) / block * block) + 1; // 보여줄 페이지의 시작
		// ((1-1)/10*10)
		int toPage = ((pg - 1) / block * block) + block; // 보여줄 페이지의 끝
		if (toPage > allPage) {
			toPage = allPage;
		}

		map.put("start", start);
		map.put("end", end);

		
		List<FrequentQuestionDTO> list = null;
		
		if(determinant == null){
			list = dao.list(map);
		}
		if(determinant != null){
			list = dao.listbycategory(map);
		} 
        
		System.out.println("list()");
		model.addAttribute("list", list);
		model.addAttribute("pg", pg);
		model.addAttribute("allPage", allPage);
		model.addAttribute("block", block);
		model.addAttribute("fromPage", fromPage);
		model.addAttribute("toPage", toPage);
		return "front.customercenter.FQ_list";
	
	}
	
	@RequestMapping("/FQ_write_view")
	public String write_view(Model model){
		System.out.println("write_view()");
		return "front.customercenter.FQ_write_view";
	}
	
	@RequestMapping("/FQ_write")
	public String write(HttpServletRequest request, Model model){
		System.out.println("write()");
		FrequentQuestionDTO dto = new FrequentQuestionDTO();
		dto.setFq_category(request.getParameter("fq_category"));
		dto.setFq_title(request.getParameter("fq_title"));
		dto.setFq_contents(request.getParameter("fq_contents"));
		ICustomerCenterDao dao = sqlSession.getMapper(ICustomerCenterDao.class); // IBDao에서 Mapper를 얻어올거야
		dao.write(dto);  

		return "redirect:/FQ_list";				// /WEB-INF/views/list.jsp
	}// write() end 
	
	
}
