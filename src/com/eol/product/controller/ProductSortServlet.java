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
 * Servlet implementation class ProductSortServlet
 */
@WebServlet("/product/productSort")
public class ProductSortServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSortServlet() {
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
	int numPerPage=5;
	
//	List<Product> list=new ProductService().productList(cPage,numPerPage);
	List<Product> list=new ArrayList();
	
	String change = "";
	request.setAttribute("change", change);
	
	change = request.getParameter("change");
	
	if(change.equals("new")) {
		list=new ProductService().newMenuList(cPage,numPerPage);
	}else if(change.equals("hot")) {
		list=new ProductService().hotMenuList(cPage,numPerPage);
	}else if(change.equals("low")) {
		list=new ProductService().lowPriceMenuList(cPage,numPerPage); 
	}else if(change.equals("high")) {
		list=new ProductService().highPriceMenuList(cPage,numPerPage);
	}
	//값에 따라 다른 리스트 받아서 list에 저장
	
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
