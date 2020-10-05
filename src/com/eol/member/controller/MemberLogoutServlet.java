package com.eol.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MemberLogoutServlet
 */
@WebServlet("/logOut.do")
public class MemberLogoutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberLogoutServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			//로그아웃 구성하기!
				//session값을 지우는것!
				HttpSession session=request.getSession(false);//세션이 있을때만 객체를 가져옴.
				if(session!=null) {
					session.invalidate();
					String msg ="로그아웃 되었습니다!";
					request.setAttribute("msg",msg);
					request.setAttribute("loc", "/");
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
					
				}
				//메인화면으로 전환.
				response.sendRedirect(request.getContextPath());
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
