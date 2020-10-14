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
 * Servlet implementation class HearderCartViewServlet
 */
@WebServlet("/views/cart/hearderCartViewServlet")
public class HearderCartViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HearderCartViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m =(Member) request.getSession().getAttribute("loginMember");
		
		if(m != null) {
			System.out.println("멤버 확인"+m);
			List<Cart> list = new CartService().cartintopay(m.getmNo()); 
			request.getSession().setAttribute("memberCart", list);
			System.out.println("memberCart확인  :" + list);
			request.getRequestDispatcher("/views/cart/memberCart.jsp").forward(request, response);
		}else{
			List<Product> list = (List)request.getSession().getAttribute("nonCartList");
			response.sendRedirect(request.getContextPath() +"/views/cart/cart.jsp");
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
