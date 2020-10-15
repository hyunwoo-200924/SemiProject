package com.eol.cart.controller;

import java.io.IOException;

import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.cart.model.service.CartService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class CartDeleteAllServlet
 */
@WebServlet("/cartDeleteAll.do")
public class CartDeleteAllServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CartDeleteAllServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		Member m =(Member) request.getSession().getAttribute("loginMember");
		
		if(m == null) {
			//비 회원 일때
			request.getSession().invalidate();
			
			String msg = "삭제 되었습니다.";
			request.setAttribute("msg",msg);
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			//회원 일때
			
			int mNo = m.getmNo();
			int result = new CartService().deleteCartAll(mNo);
			System.out.println("리절트 값" + result);
//			String msg = "장바구니가 전부 삭제 되었습니다.";
//			String loc = "/";
			
			if(result > 0) {
				request.getSession().invalidate();
//				request.setAttribute("msg", msg);
//				request.setAttribute("loc", loc);
//				request.getRequestDispatcher("/views/common/msg.jsp").forward(request,response);
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
