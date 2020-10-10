package com.eol.mypage.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Coupon;
import com.eol.member.model.service.CouponService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class CouponListServlet
 */
@WebServlet("/couponList")
public class CouponListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CouponListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = (int)((Member)request.getSession().getAttribute("loginMember")).getmNo();
		
		List<Coupon> list = new CouponService().selectCoupon(mNo);
		
		if(!list.isEmpty()) {
			System.out.println("성공");
			System.out.println(list);
			request.setAttribute("list", list);
			request.getRequestDispatcher("/views/coupon/couponList.jsp").forward(request, response);
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
