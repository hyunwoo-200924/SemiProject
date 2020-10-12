package com.eol.cart.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		int pCount = 1;
		
		List<Product> nonCartList = (ArrayList)request.getSession().getAttribute("nonCartList");
		
		if(nonCartList.size() == 0) {
			System.out.println("장바구니에 아무것도 안담겼다");
			Product p = new ProductService().selectOneProduct(pNo);
			p.setpCount(pCount);
			nonCartList.add(p);
		} else {
			for(int ii = 0; ii < nonCartList.size(); ii++) {
				List a = new ArrayList();
				for(int i = 0; i < nonCartList.size(); i++) {
					a.add(nonCartList.get(i).getpNo());
				}
				System.out.println(a);
				if(a.contains(pNo)) {
					System.out.println("같은상품 들어왔어");
					for(int j = 0; j < nonCartList.size(); j++) {
						if(nonCartList.get(j).getpNo() == pNo) {
							int cou = nonCartList.get(j).getpCount() + 1;
							nonCartList.get(j).setpCount(cou);
							break;
						}
					}
					break;
				} else {
					Product p1 = new ProductService().selectOneProduct(pNo);
					System.out.println("처음 들어온 상품" + p1.getpCount());
					System.out.println(pCount);
					p1.setpCount(pCount);
					System.out.println(p1.getpCount());
					nonCartList.add(p1);
					break;
				}
			}
		}
		request.getSession().setAttribute("nonCartList", nonCartList);
		System.out.println("여기확인" + nonCartList);
		response.sendRedirect(request.getContextPath() +"/views/cart/cart.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
