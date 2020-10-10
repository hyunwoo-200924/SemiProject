package com.eol.product.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.product.model.vo.Product;
import com.eol.product.service.ProductService;

/**
 * Servlet implementation class ProductDeleteServlet
 */
@WebServlet("/product/productDelete")
public class ProductDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int pNo = Integer.parseInt(request.getParameter("pNo"));
		if(request.getParameter("pNo").equals("")) {
			   System.out.println(pNo);
			      }
		
//		if(pNo==(p.getpNo())) {
//			
//		}
		System.out.println("값이 잇음");
		int result=new ProductService().deleteProduct(pNo);
		System.out.println("받아옴");
	
	String msg="";
	String loc="";
	String path="";
	if(result>0) {
		//선택한 공지사항이 삭제됨.
		msg="선택한 상품이 삭제되었습니다.";
		loc="/product/productList";
		path="/views/common/msg.jsp";
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
	}else {
		System.out.println("값이 0이니깐  다오문제냐?실패냐");
		System.out.println(result);
		request.setAttribute("result",result);
		msg="상품을 삭제에 실패하엿습니다..";
		path="/view/product/productList.jsp";
	}
	System.out.println("경로실패냐");
	request.getRequestDispatcher(loc).forward(request, response);
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
