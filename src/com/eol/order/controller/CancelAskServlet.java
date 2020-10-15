package com.eol.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.Orders;

/**
 * Servlet implementation class CancelAskServlet
 */
@WebServlet("/cancelask")
public class CancelAskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CancelAskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("이거 비회원 주문번호 취소누를때 나오는거"+request.getParameter("oNo"));
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		
		int result = new OrderService().changeoStatus(oNo);
		
		if(result>0) {
			Orders o = new OrderService().orderSelect(oNo);
			request.setAttribute("nMOrder", o);
			request.getRequestDispatcher("/views/noneMemberOrderDelivery.jsp");
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
