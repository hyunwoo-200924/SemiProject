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
 * Servlet implementation class ReturnAskServlet
 */
@WebServlet("/returnask")
public class ReturnAskServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReturnAskServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int oNo = Integer.parseInt(request.getParameter("oNo"));
		System.out.println(oNo);
		String st = "환불신청";
		int result = new OrderService().changeoDeliveryStatus(oNo, st);
			
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
