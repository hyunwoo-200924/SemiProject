package com.eol.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.MemberService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/MemberUpdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = new Member();
		m.setmId(request.getParameter("id"));
		m.setmPw(request.getParameter("new_pw"));//비밀번호를 입력하지 않았다면 ""
		m.setmName(request.getParameter("name"));
		m.setmBirth(request.getParameter("birth"));
		m.setmEmail(request.getParameter("email"));
		m.setmGender(request.getParameter("gender"));
		m.setmPhone(request.getParameter("phone"));
		
		int result = new MemberService().updateMember(m);
		System.out.println(result);
		
		if(result > 0) {
			response.sendRedirect(request.getContextPath() + "/views/member/memberUpdate.jsp");
		}else {
			
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
