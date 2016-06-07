package com.kosta.project;

import java.security.Principal;
import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kosta.project.dao.IMembersDAO;
import com.kosta.project.dto.MembersDTO;

import jdk.nashorn.internal.ir.RuntimeNode.Request;

@Controller
public class MyPageController {
	
	@Autowired
	private SqlSession sqlSession;
	
	// 마이페이지 이동
	@RequestMapping("/mypage")
	public String MyPage() {
		return "front.mypage.mypage";
	}
	
	
	// 회원정보 수정페이지로 이동
	@RequestMapping("/editmember")
	public String editmember(Model model, Principal principal) {
		IMembersDAO imdao = sqlSession.getMapper(IMembersDAO.class); //DB연동
		String id = principal.getName(); //현재 로그인 한 아이디를 가져오도록 하는 구문 => principal이 그 역할을 함
		MembersDTO mdto = imdao.idselectAll(id); // 여기서 로그인 한 아이디의 모든 정보가 mdto에 담긴다
		
		// 아이디, 이름, 이메일 수정(단, 아이디, 이름은 고정)을 위해 editmember.jsp로 보냄
		model.addAttribute("identify", mdto);
		model.addAttribute("myname", mdto);
		String email1 = mdto.getEmail();
		System.out.println(email1);
		String[] email2 = email1.split("@");
		for(int i=0; i<email2.length; i++) {
			System.out.println(email2[i]);
		}
		System.out.println(email2[0]);
		
		model.addAttribute("elemail", email2[0]);
		
		// 연락처 수정을 위해 editmember.jsp로 보냄
		String phone1 = mdto.getPhone();
		System.out.println(phone1); 
		String phone2 = phone1.substring(3, 7); // 연락처 가운데 번호
		System.out.println(phone2);
		String phone3 = phone1.substring(7, 11); // 연락처 끝 번호
		System.out.println(phone3);
		model.addAttribute("cphone", phone2);
		model.addAttribute("cphone1", phone3);
		
		//우편번호 수정을 위해 editmember.jsp로 보냄
		model.addAttribute("zip", mdto);
		
		//주소 수정을 위해 editmember.jsp로 보냄
		String add1 = mdto.getAddress(); // full 주소이름
		System.out.println(add1);
		String add2 = add1.substring(0, 14); // address1
		System.out.println(add2);
		String add3 = add1.substring(15); // address2
		System.out.println(add3);
		model.addAttribute("add", add2);
		model.addAttribute("add1", add3);
		
		//생일 수정을 위해 editmember.jsp로 보냄
		model.addAttribute("bir", mdto);
		
		return "front.mypage.editmember";
	}
	
	/*// 회원정보 수정 업데이트
	@RequestMapping("/editOk")
	public String editOk(Principal principal) {
		IMembersDAO imdao = sqlSession.getMapper(IMembersDAO.class); //DB연동
		String id = principal.getName(); //현재 로그인 한 아이디를 가져오도록 하는 구문 => principal이 그 역할을 함
		MembersDTO mdto = imdao.idselectAll(id); // 여기서 로그인 한 아이디의 모든 정보가 mdto에 담긴다
		imdao.editMember(mdto);
		return "redirect:/mypage";
	}*/
	
	// 회원정보 수정 업데이트
	   @RequestMapping("/editOk")
	   public String editOk(Principal principal, MembersDTO mdto,HttpServletRequest request) {
	      IMembersDAO imdao = sqlSession.getMapper(IMembersDAO.class); //DB연동
	      //String id = principal.getName(); //현재 로그인 한 아이디를 가져오도록 하는 구문 => principal이 그 역할을 함
	      //MembersDTO mdto = imdao.idselectAll(id); // 여기서 로그인 한 아이디의 모든 정보가 mdto에 담긴다
	      
	      //jsp에서 넘길때 여러값으로 나눠서 넘어오는 주소, phone, email등은 합쳐서 set해줘야함
	      mdto.setAddress(request.getParameter("address1")+ " " +request.getParameter("address2"));
	      mdto.setPhone(request.getParameter("phone1")+request.getParameter("phone2")+request.getParameter("phone3"));
	      mdto.setEmail(request.getParameter("email1") + "@" + request.getParameter("email2"));
	      mdto.setId(principal.getName());
	      
	      //update문 실행
	      imdao.editMember(mdto);
	      
	      return "redirect:/mypage";
	   }
	
	// 회원탈퇴 페이지로 이동
	@RequestMapping("/deleteMember")
	public String deleteMember() {
		return "front.mypage.deleteMember";
	}
	
	//회원탈퇴 완료
	@RequestMapping("/deleteOk")
	public String deleteOk(Principal principal) {
		IMembersDAO imdao = sqlSession.getMapper(IMembersDAO.class); //DB연동
		String id = principal.getName(); //현재 로그인 한 아이디를 가져오도록 하는 구문 => principal이 그 역할을 함
		MembersDTO mdto = imdao.idselectAll(id); // 여기서 로그인 한 아이디의 모든 정보가 mdto에 담긴다
		imdao.deleteMember(mdto);
		return "front.mypage.deleteOk";
	}
}
