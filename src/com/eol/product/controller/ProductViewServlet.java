package com.eol.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.product.model.vo.Product;
import com.eol.product.service.ProductService;

/**
 * Servlet implementation class ProductViewServlet
 */
@WebServlet("/product/productView")
public class ProductViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int pNo=Integer.parseInt(request.getParameter("pNo"));
		
		if(pNo==0) {
			System.out.println("값을 가져와야합니다");
			
		}else {
			System.out.println("값이 있네요");
		}
		Product p=new ProductService().selectOneProduct(pNo);
		
		String msg="";
		String loc="";
		String path="";
		System.out.println("조건문 전입니다.");
		if(p==null) {
			//선택한 공지사항이 삭제됨.
			msg="선택한 공지사항이 존재하지 않습니다.";
			loc="/product/productList";
			path="/views/common/msg.jsp";
			request.setAttribute("msg",msg);
			request.setAttribute("loc",loc);
		}else {
			System.out.println("거의다왓어요");
			request.setAttribute("Product",p);//object, 변수명
			path="/views/product/productView.jsp";
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
