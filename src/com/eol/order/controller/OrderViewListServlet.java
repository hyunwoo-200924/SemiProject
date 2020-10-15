package com.eol.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.OrderDetail;
import com.eol.order.model.vo.Orders;
import com.eol.product.model.vo.Product;

/**
 * Servlet implementation class OrderViewListServlet
 */
@WebServlet("/orderViewList.do")
public class OrderViewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderViewListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		System.out.println("로그인한 회원번호 "+mNo);
		List<Orders> orderslist = new OrderService().orderList(mNo);//결제상태가 결제완료 이고, 배송상태가 배송중, 배송준비중, 배송완료, 구매확정인 것들만 담아옴
		
		
		
		for(Orders order : orderslist) {

			List<OrderDetail> odlist = new OrderService().orderdetailList(order);//각 주문 1건에 있는 주문상세내역 list
			
			for(OrderDetail od : odlist) {
				Product p = new OrderService().odproduct(od);//주문 상세내역의 각 상품들 정보 가져오기
				od.setOdproduct(p);
			}
			order.setDetails(odlist);
			
		}
		
		request.setAttribute("orderlist", orderslist);
		
		
		request.getRequestDispatcher("views/mypage/orderviewlist.jsp").forward(request, response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
