package com.eol.cart.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;

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
		//1. 비회원일 때 Cookie에 저장하기
		//- 회원 정보 가져오기(로그인, 비로그인)
		//- 상품정보 가져오기
		
		Member m = (Member)request.getAttribute("loginMember"); //회원 정보 가져오기
		
		
		if(m ==null) {
			// 2.비회원의 경우
			// -쿠키를 생성 한다.
			
			System.out.println("비회원");
		}else {
			System.out.println("회원 이네");
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
