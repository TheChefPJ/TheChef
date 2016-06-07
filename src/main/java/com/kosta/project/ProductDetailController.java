package com.kosta.project;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.project.dao.IDetailDao;
import com.kosta.project.dto.CheckOutDTO;
import com.kosta.project.dto.RecipeReviewDTO;

@Controller
public class ProductDetailController {

	@Autowired
	private SqlSession sqlSession;

	@RequestMapping("/recipe_details") 
	public String recipe_details(HttpServletRequest request, Model model, Principal principal) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("recipe_details()");

		String p_no = request.getParameter("p_no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		IDetailDao dao = sqlSession.getMapper(IDetailDao.class);
		List recipeList = dao.rtpList(p_no);

		model.addAttribute("list", recipeList);
		//////////////// review 부분//////////////////
		List reviewList = dao.reviewList(p_no);

		////////////////////////////////////////////////////////////
		// page 처리 부분// 상품 리뷰부분 paging 처리!///
		int pageSize = 7;
		int Allcount = 0, count1 = 0;

		String pageNum = request.getParameter("pageNum");
		if (pageNum == null) {
			pageNum = "1";
		}
		System.out.println("pageNum : " + pageNum);

		int currentPage = Integer.parseInt(pageNum);
		System.out.println("currentPage : " + currentPage);

		int startRow = (currentPage * pageSize) - 6;// 8번부터 2페이지
		System.out.println("startRow: " + startRow);

		int endRow = currentPage * pageSize;// 1*20
		System.out.println("endRow: " + endRow);

		Allcount = reviewList.size();// 전체 관심상품 목록 개수
		System.out.println("Allcount: " + Allcount);
		//////////////////////////////////////////////
		List searchOnePageList = null;

		searchOnePageList = dao.searchOnePage(p_no, startRow, endRow);// 1~7
		count1 = searchOnePageList.size();// 5
		System.out.println("searchOnePageCount: " + count1);
		
		model.addAttribute("code", new Integer(code));
		model.addAttribute("count1", new Integer(count1));
		model.addAttribute("searchOnePageList", searchOnePageList);// jsp에 뿌릴
																	// 리스트
		/////////////////////////
		model.addAttribute("currentPage", new Integer(currentPage));
		model.addAttribute("startRow", new Integer(startRow));
		model.addAttribute("endRow", new Integer(endRow));
		model.addAttribute("Allcount", new Integer(Allcount));
		model.addAttribute("pageSize", new Integer(pageSize));

		return "front.recipe_theme.recipe_details";
	}

	@RequestMapping("/farmProduct_details")
	public String farmProduct_details(HttpServletRequest request, Model model, Principal principal) throws Exception {
		request.setCharacterEncoding("utf-8");
		System.out.println("farmProduct_details()");

		String p_no = request.getParameter("p_no");
		return "front.farmProduct.farmProduct_details";
	}
	
	@RequestMapping("/review_write")
	public String review_write(HttpServletRequest request, Model model, Principal principal) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("review_write()");
		
		String p_no = request.getParameter("p_no");
		int code = Integer.parseInt(request.getParameter("code"));
		
		model.addAttribute("p_no", p_no);
		model.addAttribute("id", principal.getName());
		model.addAttribute("code", code);
		
		return "front.recipe_theme.review_write";
	}
	
	@RequestMapping("/listAfterWrite")
	public String listAfterWrite(HttpServletRequest request, Model model, Principal principal) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("listAfterWrite()");
		
		String p_no = request.getParameter("p_no");
		String id = request.getParameter("id");
		String r_review = request.getParameter("r_review");
		String r_title = request.getParameter("r_title");
		int r_score = Integer.parseInt(request.getParameter("r_score"));
		int code = Integer.parseInt(request.getParameter("code"));
		
		RecipeReviewDTO dto = new RecipeReviewDTO();
		dto.setR_no(p_no);
		dto.setId(id);
		dto.setR_review(r_review);
		dto.setR_title(r_title);
		dto.setScore(r_score);

		IDetailDao dao = sqlSession.getMapper(IDetailDao.class);
		dao.insertReview(dto);
		
		return "redirect:/recipe_details?p_no=" + p_no + "&code=" + code;
	}
	
	CheckOutDTO dto = new CheckOutDTO();
	
	@RequestMapping("/check_out")
	public String check_out(HttpServletRequest request, Model model, Principal principal) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("check_out()");
		
		String c_no = request.getParameter("p_no");
		int count = Integer.parseInt(request.getParameter("quantity"));
		int c_price = Integer.parseInt(request.getParameter("p_price"));
		String id = principal.getName();
		int shipping_fee;
		if(c_price >= 10000){
			shipping_fee=0;
		} else {
			shipping_fee=2500;
		}
		int c_total_price = (count * c_price) + shipping_fee;//총 결제 금액
		int code = Integer.parseInt(request.getParameter("code"));
		String thumbFile = request.getParameter("p_thumbFile");
		
		IDetailDao dao = sqlSession.getMapper(IDetailDao.class);
		dto.setC_no(c_no);
		dto.setCount(count);
		dto.setC_price(c_price);
		dto.setId(id);
		dto.setShipping_fee(shipping_fee);
		dto.setC_total_price(c_total_price);
		
		/*dao.insertCheckOut(dto);*/
		
		model.addAttribute("c_no",c_no);
		model.addAttribute("count",count);
		model.addAttribute("c_price",c_price);
		model.addAttribute("id",id);
		model.addAttribute("shipping_fee",shipping_fee);
		model.addAttribute("c_total_price",c_total_price);
		model.addAttribute("code",code);
		model.addAttribute("thumbFile",thumbFile);
		
		return "front.cart.check_out";
	}
	
	@RequestMapping("/payment")//결제 테이블에 insert
	public String payment(HttpServletRequest request, Model model, Principal principal) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("payment()");
		
		String c_name = request.getParameter("last_name") + request.getParameter("first_name");
		String c_address = request.getParameter("address1") + request.getParameter("address2");
		String c_zip_code = request.getParameter("zip_code");
		String c_phone = request.getParameter("phone");
		
		IDetailDao dao = sqlSession.getMapper(IDetailDao.class);
		
		
		dto.setC_name(c_name);
		dto.setC_address(c_address);
		dto.setC_zip_code(c_zip_code);
		dto.setC_phone(c_phone);
		
		dao.insertCheckOut(dto);
		
		model.addAttribute("c_name",c_name);
		model.addAttribute("c_address",c_address);
		model.addAttribute("c_zip_code",c_zip_code);
		model.addAttribute("c_phone",c_phone);
		model.addAttribute("c_no",dto.getC_no());
		model.addAttribute("id",dto.getId());
		model.addAttribute("c_total_price",dto.getC_total_price());
		
		return "front.cart.payment";
	}
	
	@RequestMapping("/paymentFail") //결제 실패 시 디비에서 지운다
	public String paymentFail(HttpServletRequest request, Model model, Principal principal) throws Exception{
		request.setCharacterEncoding("utf-8");
		System.out.println("paymentFail()");
		
		String c_no = request.getParameter("c_no");
		String id = request.getParameter("id");
		
		IDetailDao dao = sqlSession.getMapper(IDetailDao.class);
		
		dao.deleteCheckOut(c_no, id);
		
		return "front.main.index";
	}
	
}
