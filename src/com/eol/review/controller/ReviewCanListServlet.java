package com.eol.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.product.model.vo.Product;
import com.eol.review.model.service.ReviewService;
import com.eol.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/reviewCanList")
public class ReviewCanListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewCanListServlet() {
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
		
		int cPage2;
		try {
			cPage2=Integer.parseInt(request.getParameter("cPage2"));
		}catch(NumberFormatException e) {
			cPage2=1;
		}
		int numPerPage=5;
		
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		
		List<Review> list=new ReviewService().reviewPullList(cPage,numPerPage,mNo);
		List<Review> list2=new ReviewService().reviewList(cPage2,numPerPage, mNo);
		int totalData=new ReviewService().reviewPullCount(mNo);
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar="";
		if(pageNo==1) {
			pageBar+="<span>[이전]</span>";
			
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/review/reviewCanList?cPage="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<span>"+pageNo+"</span>";
			}else {
				pageBar+="<a href='"+request.getContextPath()+"/review/reviewCanList?cPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			
		}
		if(pageNo>totalPage) {
			pageBar+="<span>[다음]</span>";
		}else {
			pageBar+="<a href='"+request.getContextPath()+"/review/reviewCanList?cPage="+pageNo+"'>[다음]</a>";
		}
		request.setAttribute("list",list);
		request.setAttribute("list2",list2);
		request.setAttribute("pageBar", pageBar);
		
		request.getRequestDispatcher("/views/review/reviewCanList.jsp").forward(request,response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
