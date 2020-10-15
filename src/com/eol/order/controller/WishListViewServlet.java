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
import com.eol.order.model.vo.WishList;

/**
 * Servlet implementation class WishListViewServlet
 */
@WebServlet("/wishListView")
public class WishListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		
		List<WishList> list = new OrderService().selectJjim(mNo);
		
		request.setAttribute("WishList", list);
		request.getRequestDispatcher("/views/order/wishList_hy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
