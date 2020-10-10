package com.eol.mypage.controller;

import java.io.IOException;
import java.util.List;

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
@WebServlet("/pointPageView.do")
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
		//Member 테이블의 mNo를 point 테이블의 mNo에 담기
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		List<Point> pointlist = new PointService().pointList(mNo);
		
		request.setAttribute("pointlist", pointlist);
		request.getRequestDispatcher("views/mypage/maypagePointListView.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
