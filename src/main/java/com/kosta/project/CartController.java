package com.kosta.project;

import java.security.Principal;
import java.sql.Timestamp;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.project.dao.ICartDao;

@Controller
public class CartController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/cart")
	public String cart(HttpServletRequest request, Model model) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("cart()");
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());// reg_date
		int f_total_price;

		int p_price = Integer.parseInt(request.getParameter("p_price"));
		String f_no = request.getParameter("p_no");// f_no
		String id = request.getParameter("id");// id
		String code = request.getParameter("code");//code가 1이면 레시피/테마에서 code가 2이면 상품 골라담기에서 온 것
		
		System.out.println("접속된 id : " + id);
		System.out.println("p_price : " + p_price);
		System.out.println("f_no : " + f_no);
		System.out.println("code : " + code);
		
		ICartDao dao = sqlSession.getMapper(ICartDao.class);
		List isExist = dao.findExist(id, f_no);
		System.out.println("isExist size : " + isExist.size());
		if(isExist.size() == 0) {
			System.out.println("장바구니에 해당 상품이 없을 때");
			int f_total_count = 1;
			f_total_price = f_total_count * p_price;
			dao.insertCart(f_no, id, reg_date, f_total_price, f_total_count);// 장바구니에 insert
		} else {
			System.out.println("장바구니에 해당 상품이 있을 때");
			int f_total_count = dao.findTotalCount(id, f_no);
			f_total_count += 1; //이미 장바구니에 들어있으면 갯수를 하나 증가시켜준다.
			f_total_price = f_total_count * p_price;
			//update
			dao.updateCart(f_total_count, f_total_price, id, f_no);
		}
		
		////////////////////////////////////////////////////////////
		// page 처리 부분//
		int pageSize = 7;
		int Allcount = 0, count1 = 0;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum : " + pageNum);

		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		int startRow = (currentPage * pageSize) - 6;//8번부터 2페이지
		System.out.println("startRow: " + startRow);

		int endRow = currentPage * pageSize;// 1*20
		System.out.println("endRow: " + endRow);

		List searchAllList = dao.cartList(id);
		System.out.println("searchAllList: " + searchAllList.toString());

		Allcount = searchAllList.size();// 전체 관심상품 목록 개수
		System.out.println("Allcount: " + Allcount);
		//////////////////////////////////////////////
		List searchOnePageList = null;
		
		searchOnePageList = dao.searchOnePage(id, startRow, endRow);//1~7
		count1 = searchOnePageList.size();//5
		System.out.println("searchOnePageCount: " + count1);
		
		model.addAttribute("count1", new Integer(count1));
		model.addAttribute("code", code);
		model.addAttribute("searchOnePageList", searchOnePageList);//jsp에 뿌릴 리스트
		/////////////////////////
		model.addAttribute("searchAllList", searchAllList);
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("Allcount", new Integer(Allcount));
		model.addAttribute("pageSize", new Integer(pageSize));
		
		return "front.cart.cart";
	}
	
	@RequestMapping("/cartList")
	public String cartList(HttpServletRequest request, Model model, Principal principal) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("cart()");

		String id = principal.getName();
		
		System.out.println("접속된 id : " + id);
		
		ICartDao dao = sqlSession.getMapper(ICartDao.class);
		
		////////////////////////////////////////////////////////////
		// page 처리 부분//
		int pageSize = 7;
		int Allcount = 0, count1 = 0;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum : " + pageNum);

		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		int startRow = (currentPage * pageSize) - 6;
		System.out.println("startRow: " + startRow);

		int endRow = currentPage * pageSize;// 1*20
		System.out.println("endRow: " + endRow);

		List searchAllList = dao.cartList(id);
		System.out.println("searchAllList: " + searchAllList.toString());

		Allcount = searchAllList.size();// 전체 관심상품 목록 개수
		System.out.println("Allcount: " + Allcount);
		//////////////////////////////////////////////
		List searchOnePageList = null;
		//레시피/테마인 경우
		searchOnePageList = dao.searchOnePage(id, startRow, endRow);
		count1 = searchOnePageList.size();
		
		System.out.println("searchOnePageCount: " + count1);//한페이지에 몇 개의 게시물이 있는지
		
		
		model.addAttribute("count1", new Integer(count1));
		model.addAttribute("searchOnePageList", searchOnePageList);
		/////////////////////////
		model.addAttribute("searchAllList", searchAllList);
		model.addAttribute("currentPage", new Integer(currentPage));
		//model.addAttribute("startRow", new Integer(startRow));
		//model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("Allcount", new Integer(Allcount));
		model.addAttribute("pageSize", new Integer(pageSize));
		
		return "front.cart.cart";
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart(HttpServletRequest request, Model model, Principal principal) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("deleteCart()");
		
		String[] f_no = request.getParameterValues("f_no");
	    String id = principal.getName();
	    
	    System.out.println("접속된 id : " + id);
	    for(int i=0;i<f_no.length;i++){
	         System.out.println("f_no : "+ f_no[i]);
	      }
	    
		ICartDao dao = sqlSession.getMapper(ICartDao.class);
		for(int i=0;i<f_no.length;i++){
			dao.deleteCart(id, f_no[i]);//상품을 선택한 개수만큼 삭제
		}
		////////////////////////////////////////////////////////////
		// page 처리 부분//
		int pageSize = 7;
		int Allcount = 0, count1 = 0;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum : " + pageNum);

		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		int startRow = (currentPage * pageSize) - 6;
		System.out.println("startRow: " + startRow);

		int endRow = currentPage * pageSize;// 1*20
		System.out.println("endRow: " + endRow);

		////////////////////////////////////////////////
		List searchAllList = dao.cartList(id);
		System.out.println("searchAllList: " + searchAllList.toString());

		Allcount = searchAllList.size();// 전체 관심상품 목록 개수
		System.out.println("Allcount: " + Allcount);
		//////////////////////////////////////////////
		List searchOnePageList = null;
		//레시피/테마인 경우
		searchOnePageList = dao.searchOnePage(id, startRow, endRow);
		count1 = searchOnePageList.size();
		System.out.println("searchOnePageCount: " + count1);
		
		model.addAttribute("count1", new Integer(count1));
		model.addAttribute("searchOnePageList", searchOnePageList);
		/////////////////////////
		model.addAttribute("searchAllList", searchAllList);
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("Allcount", new Integer(Allcount));
		model.addAttribute("pageSize", new Integer(pageSize));
		
		return "front.cart.cart";
	}
}
