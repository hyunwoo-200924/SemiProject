package com.eol.cart.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		
		
		System.out.println(request.getParameter("pCount"));
		System.out.println(request.getParameter("pNo"));
		System.out.println(request.getParameter("날짜가 널이냐?"+"OderDay"));

		Member m = (Member)request.getSession().getAttribute("loginMember"); //회원 정보 가져오기
		int pNo=Integer.parseInt(request.getParameter("pNo"));
		
		String oDeliveryEDate = request.getParameter("OderDay");
		
		if(oDeliveryEDate == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date today = new Date();
			oDeliveryEDate = sdf.format(today);
		}
		
		System.out.println(oDeliveryEDate);
		
		String pCountStr = request.getParameter("pCount");
		int pCount = 0;
		
		List a = new ArrayList();//상품번호 담을 리스트
		
		if(pCountStr == null) {
			pCount = 1;
		} else {
			pCount = Integer.parseInt(request.getParameter("pCount"));

		}
		
		if(m == null) {
			//비회원 일때
			List<Product> nonCartList = (ArrayList)request.getSession().getAttribute("nonCartList");
			
			if(nonCartList.size() == 0) {
				
				System.out.println("장바구니에 아무것도 안담겼다");
				Product p = new ProductService().selectOneProduct(pNo);
				p.setpCount(pCount);
				p.setDelivery(oDeliveryEDate);
				
				nonCartList.add(p);
				
			} else {
				
				for(int ii = 0; ii < nonCartList.size(); ii++) {
					
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
						p1.setDelivery(oDeliveryEDate);
						
						System.out.println(p1.getpCount());
						nonCartList.add(p1);
						break;
					}
				}
			}
			
			request.getSession().setAttribute("nonCartList", nonCartList);
			System.out.println("여기확인" + nonCartList);
			response.sendRedirect(request.getContextPath() +"/views/cart/cart.jsp");
		}else {
			//회원 일때
			System.out.println("회원일때");
			Cart c = new Cart();
			c.setmNo(m.getmNo());
			c.setpNo(pNo);
			c.setoDeliveryEDate(oDeliveryEDate);
			
			int result = 0;
			
			List<Cart> list = new CartService().cartintopay(m.getmNo()); 
			
			a = new ArrayList();
			for(int i = 0; i < list.size(); i++) {
				a.add(list.get(i).getpNo());
			}
			System.out.println(a);
			
			if(a.contains(pNo)) {
				//같은 상품 들어올때
				System.out.println("수량 :"+pCount);
				result = new CartService().updateCartNum(m.getmNo(),pNo,oDeliveryEDate);
				System.out.println("같은 상품"+result);
				
				
			} else {
				//다른 상품 들어올때
				c.setcQty(pCount);
				result = new CartService().insertCart(c);
				System.out.println("다른 상품"+result);
			}
			
			
			if(result>0) {
				System.out.println(list);
				String msg ="상품이 장바구니에 담겼습니다.";
				
				List<Cart> list1 = new CartService().cartintopay(m.getmNo());
				request.getSession().setAttribute("memberCart", list1);
				
				request.setAttribute("msg",msg);
				request.setAttribute("loc", "/views/cart/memberCart.jsp");
				request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
