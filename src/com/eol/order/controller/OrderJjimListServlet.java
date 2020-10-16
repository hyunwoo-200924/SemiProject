package com.eol.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.CouponService;
import com.eol.member.model.vo.Member;
import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.Orders;
import com.eol.order.model.vo.WishList;
import com.eol.qna.model.vo.Paging;

/**
 * Servlet implementation class OrderJjimListServlet
 */
@WebServlet("/OrderJjimList")
public class OrderJjimListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderJjimListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		
		
		
		//주문내역 가져오기
		List<Orders> list = new OrderService().selectOrder(mNo);
		
		if(!list.isEmpty()) {
			
			for(Orders o : list) {
				
				int oNo = o.getoNo();
				int oAmount = o.getoAmount()-1;
				
				String[] pNamepImage = new OrderService().orderdetailList(oNo);
				
				o.setOrderContent(pNamepImage[0] + " 외" + " " + oAmount + "건");
				o.setpImage1(pNamepImage[1]);
				
			}
		}
		
		//찜한 목록 가져오기
		List<WishList> list2 = new OrderService().selectJjim(mNo);
		
		//쿠폰 갯수 가져오기
		int coCount = new CouponService().countCoupon(m.getmNo());
		
		request.setAttribute("coCount", coCount);
		request.setAttribute("orderList", list);
		request.setAttribute("JjimList", list2);
		
		request.getRequestDispatcher("views/mypage/mypagemain.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
