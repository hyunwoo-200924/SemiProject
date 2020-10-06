package com.eol.member.controller;

import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eol.member.model.service.MemberService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindPwEndServlet
 */
@WebServlet("/findPwResult.do")
public class MemberFindPwEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindPwEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트가 보낸  아이디, 이메일을 받음(jsp의 id명과 일치)
		String findId = request.getParameter("findId"); // 아이디
		String findEmail = request.getParameter("findEmail"); // 이메일
		
		//아이디로 회원 정보를 받아오고, 아이디로 회원정보를 받아오고 가져온 데이터에서 email값을 비교하여 존재하지 않으면 인증메일 보내지 못함
		Member m = new MemberService().searchMemberPw(findId,findEmail);
		if(m == null || !m.getmEmail().equals(findEmail)) {
			
			String msg ="이메일을 다시 확인해 주세요!";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			
			// naver mail server 설정
			String host = "smtp.naver.com";
			String user = "slyb6642s@naver.com";// 보내는 사람 네이버 계정
			String password = "tjwngus1"; //보내는 사람 네이버 패스워드
			
			//메일 받을 주소
			String to_email = m.getmEmail();
			
			//SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host",host);
			props.put("mail.smtp.port",465);
			props.put("mail.smtp.auth","true");
			props.put("mail.smtp.ssl.enable","true");
			
            String AuthenticationKey = m.getmPw();
            System.out.println(AuthenticationKey);
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(user,password);
                }
            });
            //email  전송
            try {
                MimeMessage msg = new MimeMessage(session);
                msg.setFrom(new InternetAddress(user, "DDUKDDAK COOK"));
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
                
                //메일 제목
                msg.setSubject("안녕하세요 뚝딱쿡 입니다.");
                //메일 내용
                msg.setText("회원님의 비밀번호는 :"+m.getmPw()+"입니다. ");
                
                Transport.send(msg);
                System.out.println("이메일 전송");
                
            }catch (Exception e) {
                e.printStackTrace();
            }
            HttpSession saveKey = request.getSession();
            saveKey.setAttribute("AuthenticationKey", AuthenticationKey);
            request.getRequestDispatcher("/views/member/memberFindPwResult.jsp").forward(request, response);;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
