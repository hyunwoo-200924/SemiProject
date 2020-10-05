package com.eol.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.MemberService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MemberJoinServlet
 */
@WebServlet("/memberEnllor.do")
public class MemberJoinServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberJoinServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = new Member();
		m.setmId(request.getParameter("id"));
		m.setmPw(request.getParameter("pw"));
		m.setmName(request.getParameter("name"));
		m.setmBirth(request.getParameter("birth"));
		m.setmEmail(request.getParameter("email"));
		m.setmPhone(request.getParameter("phone"));
		String address1 = request.getParameter("address1"); //주소
		String address2 = request.getParameter("address2"); //상세주소
		System.out.println(address2);
		String address = address1 + ", " + address2;
		m.setmAddress(address);
		if(request.getParameter("gender") != null) {
			m.setmGender(request.getParameter("gender"));
		}else {
			m.setmGender("N");
		}
		System.out.println("111");
		
	   int result = new MemberService().insertMember(m);
		
	   //if(result != null)
	   //response.sendRedirect(어디로보내지~~);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
