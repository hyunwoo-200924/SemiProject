package com.eol.cart.controller;

import java.io.IOException;
import java.util.Iterator;
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
 * Servlet implementation class CartDeleteServlet
 */
@WebServlet("/cartDelete.do")
public class CartDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m =(Member)request.getSession().getAttribute("loginMember");
		
		if(m == null) {
			//비회원 일때
			int pNo=Integer.parseInt(request.getParameter("pNo"));
			List<Product> list = (List)request.getSession().getAttribute("nonCartList");
			
				for(Product p : list) {
				
					if(pNo == p.getpNo()) {
						list.remove(p);
						break;
					}
				}
				response.sendRedirect(request.getContextPath() +"/views/cart/cart.jsp");
			
			}else {
				//회원 일때
				
				int mNo = m.getmNo();
				int pNo=Integer.parseInt(request.getParameter("pNo"));
				System.out.println(pNo);
				
				int result = new CartService().deleteCartYs(mNo,pNo);
				String msg = "선택한 상품이 삭제 되었습니다.";
				String loc = "/views/cart/memberCart.jsp";
				
				if(result > 0) {
					List<Cart> memberCart = (List)request.getSession().getAttribute("memberCart");	
					
					for(Cart c : memberCart) {
						if(c.getpNo() == pNo) {
							memberCart.remove(c);
							break;
						}
					}
					request.getSession().setAttribute("memberCart", memberCart);
					
					request.setAttribute("msg", msg);
					request.setAttribute("loc", loc);
					request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
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
