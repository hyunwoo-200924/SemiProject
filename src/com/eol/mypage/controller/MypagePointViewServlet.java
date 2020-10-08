package com.eol.mypage.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.PointService;
import com.eol.member.model.vo.Member;
import com.eol.member.model.vo.Point;

/**
 * Servlet implementation class MypagePointViewServlet
 */
@WebServlet("/pointPage.do")
public class MypagePointViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypagePointViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//포인트 뷰 페이지 전환
		//클라이언트로 부터 포인트 정보를 받아옴
		Member m = (Member) request.getSession().getAttribute("loginMember");
		
		if(m != null) {
			Point p = new PointService().myPoint(m.getmPonint());
			request.setAttribute("selectPoint", p);
			request.getRequestDispatcher("views/mypage/maypagePoint.jsp").forward(request, response);
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
