package com.eol.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.CouponService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MypageMainViewServlet
 */
@WebServlet("/mypageMain.do")
public class MypageMainViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMainViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = (Member) request.getSession().getAttribute("loginMember");
		if(m != null) {			
			//로그인을 해서 Session에 담긴 객체가 있을경우 마이페이지로 이동
			//보유쿠폰의 갯수도 담아오기
			int coCount = new CouponService().countCoupon(m.getmNo());
			request.setAttribute("coCount", coCount);
			request.getRequestDispatcher("views/mypage/mypagemain.jsp").forward(request, response);
		
		
		
		}else {
			//로그인을 하지 않은상태일때는 로그인화면으로 이동
			request.getRequestDispatcher("views/member/memberLogin.jsp").forward(request, response);
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
