package com.eol.order.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.eol.member.model.vo.Member;
import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.Orders;

/**
 * Servlet implementation class OrderListAjaxServlet
 */
@WebServlet("/OrderList")
public class OrderListAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderListAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int mNo = 1; //확인용 아래줄 대신
		//int mNo = ((Member)request.getSession().getAttribute("loginMember")).getmNo();
		
		List<Orders> list = new OrderService().selectOrder(mNo);
		
		JSONArray olist = new JSONArray();
		
		if(!list.isEmpty()) {//주문내역이 있다면
				
			for(Orders o : list) {
					
					JSONObject order = new JSONObject();
					
					order.put("oNo", o.getoNo());
					
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
					order.put("oRDate", sdf.format(o.getoRDate()));
					order.put("oAmount", o.getoAmount());
					order.put("oPayment", o.getoPayment());
					
					olist.add(order);
				}
			}
		
		response.getWriter().print(olist);//주문내역이 없다면 olist.isEmpty()=true
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
