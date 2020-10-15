package com.eol.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
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
 * Servlet implementation class OneCartIntoPayServlet
 */
@WebServlet("/onecartintopay.do")
public class OneCartIntoPayServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final boolean Cart = false;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneCartIntoPayServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Member m = (Member)request.getSession().getAttribute("loginMember");
		if(m !=null) {
			//회원 일때
			
			int cNo =Integer.parseInt(request.getParameter("cNo"));
			List<Cart> list = new CartService().oneCartIntoPay(m.getmNo(),cNo);
			
			for(Cart c : list) {
				Product p = new CartService().cartProduct(c.getpNo());
				c.setProduct(p);
			}
			
			request.setAttribute("cartList", list);
			request.getRequestDispatcher("views/order/orderpay.jsp").forward(request, response);
		
		}else {
			//비회원 일때
			List<Product> list = (List)request.getSession().getAttribute("nonCartList");
			int pNo=Integer.parseInt(request.getParameter("pNo"));
			for(Product p : list) {
				if(pNo == p.getpNo()) {
					List c = new ArrayList();
					c.add(p);
					request.getSession().setAttribute("oneCartList", c);
					request.getRequestDispatcher("views/order/onenonorderpay.jsp").forward(request, response);
				}
			}
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
