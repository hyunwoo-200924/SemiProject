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
@WebServlet("/MemberDelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public MemberDeleteServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String pw = request.getParameter("pw");
		String id = ((Member) request.getSession().getAttribute("loginMember")).getmId();

		int result = new MemberService().deleteMember(id);
		System.out.println("여기는 왔니?");
		System.out.println(result);

		String msg="";
		String loc="/";
		   
		if(result > 0) {
			msg = "탈퇴 되었습니다. 그동안 이용해주셔서 감사합니다.";
			System.out.println("탈퇴성공"); 
			
		} else {
			msg = "탈퇴에 실패하였습니다. 서비스센터로 문의바랍니다.";
			System.out.println("탈퇴실패");
		}
		
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
