package com.eol.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.Orders;

/**
 * Servlet implementation class NoneMemberOrderNumberListView
 */
@WebServlet("/noMemorderNumview.do")
public class NoneMemberOrderNumberListView extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoneMemberOrderNumberListView() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트에게 받은 주문번호와 비밀번호로 조회하기
		String nMONum = request.getParameter("orderNum");
		String pw = request.getParameter("pw");
		
		Orders o = new OrderService().nMOrderList(nMONum, pw);
		
		request.setAttribute("nMOrder",o);
		
		request.getRequestDispatcher("/views/nonemember/noneMemberOrderDelivery.jsp").forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}