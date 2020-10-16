package com.eol.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.WishList;
import com.eol.product.model.vo.Product;
import com.eol.product.service.ProductService;

/**
 * Servlet implementation class ProductListServlet
 */
@WebServlet("/product/productList")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int cPage;
		try {
			cPage=Integer.parseInt(request.getParameter("cPage"));
		}catch(NumberFormatException e) {
			cPage=1;
		}
	int numPerPage=6;
	
	List<Product> list=new ProductService().productList(cPage,numPerPage);
	int totalData=new ProductService().productCount();
	
	int totalPage=(int)Math.ceil((double)totalData/numPerPage);
	int pageBarSize=5;
	
	int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	int pageEnd=pageNo+pageBarSize-1;
	
	String pageBar="";
	
	if(pageNo==1) {
		pageBar+="<span>[이전]</span>";
	}else {
		pageBar+="<a href='"+request.getContextPath()+"/product/productList?cPage="+(pageNo-1)+"'>[이전]</a>";
	}
	while(!(pageNo>pageEnd||pageNo>totalPage)) {
		if(pageNo==cPage) {
			pageBar+="<span>"+pageNo+"</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/product/productList?cPage="+pageNo+"'>"+pageNo+"</a>";
		}
		pageNo++;
		
	}
	if(pageNo>totalPage) {
		pageBar+="<span>[다음]</span>";
	}else {
		pageBar+="<a href='"+request.getContextPath()+"/product/productList?cPage="+pageNo+"'>[다음]</a>";
	}
	
	List<WishList> wl = null;
	if((Member)request.getSession().getAttribute("loginMember") != null) {
		int mNo = ((Member)request.getSession().getAttribute("loginMember")).getmNo();
		wl = new OrderService().selectJjim(mNo);
		System.out.println("ProductList.jsp" + wl);
	}
	request.setAttribute("wl", wl);
	request.setAttribute("list", list);
	request.setAttribute("pageBar",pageBar);
	request.getRequestDispatcher("/views/product/productList.jsp").forward(request,response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
