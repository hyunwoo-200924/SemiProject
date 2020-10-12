package com.eol.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eol.cart.model.service.CartService;
import com.eol.cart.model.vo.Cart;
import com.eol.member.model.vo.Member;
import com.eol.product.model.vo.Product;
import com.eol.product.service.ProductService;

/**
 * Servlet implementation class CartViewServlet
 */
@WebServlet("/views/cart/cartViewServlet")
public class CartViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 1.회원 정보 가져오기(로그인, 비로그인)

		Member m = (Member)request.getAttribute("loginMember"); //회원 정보 가져오기
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		System.out.println(pNo);
		if(m ==null) {
			//비회원 일때 리스트에 카트 정보를 담기
//			List<Cart> list = new CartService().nonlistCart();
			List list = new ArrayList();
			Product p = new ProductService().selectOneProduct(pNo);
			list.add(p);
			
			//3.Session 선언
			
			HttpSession session = request.getSession();
			session.setAttribute("nonCartList", list);
			
			System.out.println(list);
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
