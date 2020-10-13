package com.eol.cart.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.cart.model.service.CartService;
import com.eol.cart.model.vo.Cart;
import com.eol.member.model.vo.Member;
import com.eol.product.model.vo.Product;

/**
 * Servlet implementation class CartIntoPay
 */
@WebServlet("/cartintopay.do")
public class CartIntoPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartIntoPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Member m = (Member)request.getSession().getAttribute("loginMember");
		if(m!=null) {//회원이 장바구니에 담긴 상품을 결제할 경우
			List<Cart> list = new CartService().cartintopay(m.getmNo());
			
			for(Cart c : list ) {
				Product p = new CartService().cartProduct(c.getpNo());
				c.setProduct(p);
			}
			
			request.setAttribute("cartList", list);
			request.getRequestDispatcher("views/order/orderpay.jsp").forward(request, response);
			
		}else {//비회원이 장바구니에 담긴 상품 결제할 경우
			
			request.getRequestDispatcher("views/order/nonorderpay.jsp").forward(request, response);
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
