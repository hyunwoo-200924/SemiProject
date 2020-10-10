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
		
		int pNo=Integer.parseInt(request.getParameter("pNo"));
	int pNo1	=((Product)request.getAttribute("productList")).getpNo();
	int result=new ProductService().deleteProduct(pNo1);
	
	String msg="";
	String loc="";
	String path="";
	if(result>0) {
		//선택한 공지사항이 삭제됨.
		msg="조회한 상품이 존재하지 않습니다.";
		loc="/product/productList";
		path="/views/common/msg.jsp";
		request.setAttribute("msg",msg);
		request.setAttribute("loc",loc);
	}else {
		request.setAttribute("path",path);
		path="/views/product/productList.jsp";
	}
	request.getRequestDispatcher(path).forward(request, response);
	
	}
	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
