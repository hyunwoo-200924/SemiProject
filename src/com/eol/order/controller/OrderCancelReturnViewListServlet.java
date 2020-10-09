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
 * Servlet implementation class OrderCancelReturnViewListServlet
 */
@WebServlet("/orderCancelReturnViewList.do")
public class OrderCancelReturnViewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderCancelReturnViewListServlet() {
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
		List<Orders> olist = new OrderService().orderCancelReturnList(mNo);//결제상태가 취소신청, 취소완료 & 배송상태가 환불신청, 환불완료일 경우의 주문내역 리스트 받아옴
		
		for(Orders order : olist) {
			//어짜피 위에서 취소반품관련 orders만 가져왔기때문에 거기서 연결된 orderdetail을 가져오는거라 이건 주문조회에서 쓴 메소드로 써도 됨 
			List<OrderDetail> odlist = new OrderService().orderdetailList(order);
			
			for(OrderDetail od : odlist) {
				//이것도 orderdetail과 마찬가지로!!
				Product p = new OrderService().odproduct(od);//주문 상세내역의 각 상품들 정보 가져오기
				od.setOdproduct(p);
			}
			order.setDetails(odlist);
		}
		
		request.setAttribute("orderlist", olist);
		
		
		request.getRequestDispatcher("views/mypage/orderCancelReturnViewList.jsp").forward(request, response);
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
