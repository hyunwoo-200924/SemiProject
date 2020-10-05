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
 * Servlet implementation class MemberUpdatePwCkServlet
 */
@WebServlet("/memberUpdatePwCk")
public class MemberUpdatePwCkServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwCkServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pwck");
		String id = ((Member)request.getSession().getAttribute("loginMember")).getmId();
		
		String dbpw = new MemberService().selectMemberPw(id);
		
		if(pw.equals(dbpw)) {
			//response.sendRedirect(request.getContextPath() + "/views/member/memberUpdate.jsp");
			request.getRequestDispatcher("/views/member/memberUpdate.jsp").forward(request, response);
		} else {
			String msg = "비밀번호를 정확히 입력해 주세요.";
			String loc = "/views/member/memberUpdatePwCheck.jsp";
			
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
