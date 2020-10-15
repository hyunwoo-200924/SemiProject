package com.eol.order.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.order.model.service.OrderService;

/**
 * Servlet implementation class DeletetWishListServlet
 */
@WebServlet("/deletetWishList")
public class DeletetWishListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletetWishListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("ajax 삭제 여기 ");
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		int mNo = ((Member)request.getSession().getAttribute("loginMember")).getmNo();
		//System.out.println(pNo);

		int result = new OrderService().deletetWishList(pNo, mNo);
		
		System.out.println("ajax 여기는 삭제");
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
