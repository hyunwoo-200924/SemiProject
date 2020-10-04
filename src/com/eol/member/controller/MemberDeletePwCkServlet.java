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
 * Servlet implementation class MemberDeleteServlet
 */
@WebServlet("/MemberDeletePwCk")
public class MemberDeletePwCkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberDeletePwCkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m = new Member("lhy92312");
		request.getSession().setAttribute("loginMember", m);
		String pw = request.getParameter("pw");
		System.out.println(pw);
		String id = ((Member)request.getSession().getAttribute("loginMember")).getmId();
		System.out.println(id);
		String dbpw = new MemberService().selectMemberPw(id);
		
		boolean result = pw.equals(dbpw);
		System.out.println(result);
		
//		request.setAttribute("pw", pw);
//		request.setAttribute("dbpw", dbpw);
//		request.getRequestDispatcher("/views/member/memberDelete.jsp").forward(request, response);
		
		response.getWriter().print(result);
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
