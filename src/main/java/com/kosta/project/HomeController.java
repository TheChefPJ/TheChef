package com.kosta.project;

import java.sql.SQLException;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.kosta.project.dao.IMembersDAO;
import com.kosta.project.dto.MembersDTO;
import com.kosta.project.dto.RoleDTO;

@Controller
public class HomeController {

	@Autowired
	private SqlSession sqlSession;
	
	@Autowired
	private View jsonview;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		System.out.println("home()");
		return "front.main.index";
	}

	@RequestMapping("/login")
	public String login(Locale locale, Model model) {
		System.out.println("login()");
		return "front.member.login";
	}

	@RequestMapping("/join")
	public String goJoin(Locale locale, Model model) {
		System.out.println("join()");
		return "front.member.join";
	}

	@RequestMapping("/join_members")
	public String goInsert(MembersDTO mdto, RoleDTO rdto, HttpServletRequest request) {
		mdto.setPhone(request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3"));
		mdto.setEmail(request.getParameter("e-mail1")+"@"+request.getParameter("email2"));
		mdto.setAddress(request.getParameter("address1")+ " " +request.getParameter("address2"));
		IMembersDAO imdao = sqlSession.getMapper(IMembersDAO.class);
		imdao.insert(mdto);
		System.out.println(request.getParameter("role_name"));
		imdao.insertRole(rdto);
		return "front.main.index";
	}
	
	@RequestMapping(value="/useridok", method=RequestMethod.POST)
	public View MemberOk(HttpServletRequest request, HttpServletResponse response, ModelMap map) throws ClassNotFoundException, SQLException{
		System.out.println("controller11111111111111111111111111");
		String id = request.getParameter("id");
		System.out.println(id);
		IMembersDAO imdao = sqlSession.getMapper(IMembersDAO.class);
		int result =  imdao.getUserid(id);
		System.out.println(result);
		map.addAttribute("member", result);
		
		return jsonview;
	}

	@RequestMapping(value = "/index")
	public String index(Locale locale, Model model) {
		System.out.println("home()");
		return "front.main.index";
	}
	///////////////////////////////////////////////////////////////////////
	@RequestMapping(value="/companyInfo")
		public String companyInfo(){
		System.out.println("companyInfo()");
		return "front.aboutus.companyInfo";
	}
	////////////////// back view/////////////////////////////////////////
	/*@RequestMapping(value = "/recipeRegister")
	public String recipeResgister(Locale locale, Model model) {
		System.out.println("recipeRegister()");
		return "back.storeManage.recipeRegister";
	}

	@RequestMapping(value = "/farmProductRegister")
	public String farmProductRegister(Locale locale, Model model) {
		System.out.println("farmProductRegister()");
		return "back.storeManage.farmProductRegister";
	}

	@RequestMapping(value = "/productSelect_Modify")
	public String productSelect_Modify(Locale locale, Model model) {
		System.out.println("productSelect_Modify()");
		return "back.storeManage.productSelect_Modify";
	}
*/
	@RequestMapping(value = "/eventManage")
	public String eventManage(Locale locale, Model model) {
		System.out.println("eventManage()");
		return "back.storeManage.eventManage";
	}

	@RequestMapping(value = "/noticeManage")
	public String noticeManage(Locale locale, Model model) {
		System.out.println("noticeManage()");
		return "back.storeManage.noticeManage";
	}

	@RequestMapping(value = "/snsProductManage")
	public String snsProductManage(Locale locale, Model model) {
		System.out.println("snsProductManage()");
		return "back.storeManage.snsProductManage";
	}

	@RequestMapping(value = "/cancelManage")
	public String cancelManage(Locale locale, Model model) {
		System.out.println("cancelManage()");
		return "back.saleManage.cancelManage";
	}

	@RequestMapping(value = "/deliveryStatus")
	public String deliveryStatus(Locale locale, Model model) {
		System.out.println("deliveryStatus()");
		return "back.saleManage.deliveryStatus";
	}

	@RequestMapping(value = "/orderSendManage")
	public String orderSendManage(Locale locale, Model model) {
		System.out.println("orderSendManage()");
		return "back.saleManage.orderSendManage";
	}
	//판매자에게 발주
	@RequestMapping(value="/productOrder")
	public String productOrder(Locale locale, Model model){
		System.out.println("productOrder");
		return "back.saleManage.productOrder";
	}
	@RequestMapping(value = "/returnManage")
	public String returnManage(Locale locale, Model model) {
		System.out.println("returnManage()");
		return "back.saleManage.returnManage";
	}

	@RequestMapping(value = "/ConsumerDealList")
	public String ConsumerDealList(Locale locale, Model model) {
		System.out.println("ConsumerDealList()");
		return "back.calculateManage.ConsumerDealList";
	}

	@RequestMapping(value = "/SellerDealList")
	public String SellerDealList(Locale locale, Model model) {
		System.out.println("SellerDealList()");
		return "back.calculateManage.SellerDealList";
	}
	///////////////////////error////////////////////////
	@RequestMapping(value = "/403", method = RequestMethod.GET)
	public String error() {
		return "front.member.error";
	}	
	/////////////////////// seller////////////////////////
	@RequestMapping(value = "/sellerPage")
	public String seller(Locale locale, Model model){
	System.out.println("productAccept");
	return "seller.accept.productAccept";
	}

}
