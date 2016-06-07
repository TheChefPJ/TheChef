package com.kosta.project;

import java.util.Date;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kosta.project.dao.IMembersDAO;

@Controller
public class IdPwdCheckController {

	@Autowired
	private SqlSession sqlSession;
	
	//id찾기//
		@RequestMapping("/idFind")
		public String idFind(HttpServletRequest request, Model model){
			System.out.println("idFind()");
			String random = request.getParameter("random");
			String id = request.getParameter("id");
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			
			System.out.println("random : " + random);
			System.out.println("id : " + id);
			System.out.println("name : " + name);
			System.out.println("email : " + email);
			
			if(random == null){
				random = "0";
				System.out.println("random2 : " + random);
			}
			
			model.addAttribute("id", id); //id넘겨주기
			model.addAttribute("random",random);//난수값 넘겨주기
			model.addAttribute("name",name);
			model.addAttribute("email",email);
			
			return "front.member.idFind";
		}
		@RequestMapping("/idFindPro")
		public String idFindPro(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
			request.setCharacterEncoding("utf-8");
			int random=0;
			System.out.println("idFindPro()");
			String name = request.getParameter("name");// 사용자가 친 name값 읽어오기
			String email = request.getParameter("email");// 사용자가 친 email값 읽어오기
			System.out.println("name : " + name);
			System.out.println("email : " + email);
			IMembersDAO dao = sqlSession.getMapper(IMembersDAO.class);
			String id = dao.checkId(name, email);//id값을 얻는다.
			System.out.println("모야진짜ㅠㅠ되라고!!");
			System.out.println("id : " + id);
			if(id != null) {
				Properties p = System.getProperties();
				p.put("mail.smtp.starttls.enable", "true"); // gmail은 무조건 true 고정
				p.put("mail.smtp.host", "smtp.gmail.com"); // smtp 서버 주소
				p.put("mail.smtp.auth", "true"); // gmail은 무조건 true 고정
				p.put("mail.smtp.port", "587"); // gmail 포트

				Authenticator auth = new MyAuthentication();

				// session 생성 및 MimeMessage생성
				Session session2 = Session.getDefaultInstance(p, auth);
				MimeMessage msg = new MimeMessage(session2);

				try {
					System.out.println("들어왔니???");
					MyAuthentication ma = new MyAuthentication();
					// 편지보낸시간
					msg.setSentDate(new Date());

					InternetAddress from = new InternetAddress();

					from = new InternetAddress("Administrator<nice9010@gmail.com>");

					// 이메일 발신자
					msg.setFrom(from);

					// 이메일 수신자
					InternetAddress to = new InternetAddress(email);
					msg.setRecipient(Message.RecipientType.TO, to);

					// 이메일 제목
					msg.setSubject("요청하신 인증번호를 알려드립니다.", "UTF-8");

					// 이메일 내용
					random = (int) (Math.floor(Math.random() * 1000000)+100000);
					if(random>1000000){
						random = random - 100000;
					}
					msg.setText("아래의 인증번호를 인증번호 입력창에 입력해 주세요.\n"+"인증번호 : " + random + "입니다.", "UTF-8");

					// 이메일 헤더
					msg.setHeader("content-Type", "text/html");

					// 메일보내기
					javax.mail.Transport.send(msg);
					System.out.println("들어왔니2??");
					
					//out.println("<script>alert('sName" + sName + "');</script>");
					//out.println("<script>alert('메일로 저송이 완료되었습니다.');</script>");
					//out.flush();

				} catch (AddressException addr_e) {
					addr_e.printStackTrace();
				}
			}//if 
			else {
				System.out.println("맞는 아이디가 존재하지 않음");
				//out.println("<script>alert('해당 메일이 존재하지 않습니다.');</script>");
				//out.flush();
			}
			
			model.addAttribute("id", id); //id넘겨주기
			model.addAttribute("random",random);//난수값 넘겨주기
			model.addAttribute("name",name);
			model.addAttribute("email",email);
			System.out.println("보내기 직전");
			
			return "front.member.loginConfirm";
		}
		
		class MyAuthentication extends Authenticator {

			PasswordAuthentication pa;

			public MyAuthentication() {

				String id = "nice9010"; // 구글 ID
				String pw = "wpsldtm12"; // 구글 비밀번호

				// ID와 비밀번호를 입력한다.
				pa = new PasswordAuthentication(id, pw);

			}

			// 시스템에서 사용하는 인증정보
			public PasswordAuthentication getPasswordAuthentication() {
				return pa;
			}
		}
		
		 
		//pwd찾기//
		@RequestMapping("/pwdFind")
		public String pwdFind(){
			System.out.println("pwdFind()");
			return "front.member.idFind";
		}
		
}
