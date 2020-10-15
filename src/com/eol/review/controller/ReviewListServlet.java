package com.eol.review.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.qna.model.service.QnaService;
import com.eol.qna.model.vo.Qna;
import com.eol.review.model.service.ReviewService;
import com.eol.review.model.vo.Review;

/**
 * Servlet implementation class ReviewListServlet
 */
@WebServlet("/review/reviewList")
public class ReviewListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewListServlet() {
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
		int numPerPage2=5;
		
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		
		List<Review> list=new ReviewService().reviewPullList(cPage,numPerPage,mNo);
		List<Review> list2=new ReviewService().reviewList(cPage2,numPerPage2, mNo);
		int totalData2=new ReviewService().reviewCount();
		
		int totalPage2=(int)Math.ceil((double)totalData2/numPerPage2);
		int pageBarSize=5;
		int pageNo=((cPage2-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar2="";
		if(pageNo==1) {
			pageBar2+="<span>[이전]</span>";
			
		}else {
			pageBar2+="<a href='"+request.getContextPath()+"/review/reviewList?cPage2="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage2)) {
			if(pageNo==cPage2) {
				pageBar2+="<span>"+pageNo+"</span>";
			}else {
				pageBar2+="<a href='"+request.getContextPath()+"/review/reviewList?cPage2="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
			
		}
		if(pageNo>totalPage2) {
			pageBar2+="<span>[다음]</span>";
		}else {
			pageBar2+="<a href='"+request.getContextPath()+"/review/reviewList?cPage2="+pageNo+"'>[다음]</a>";
		}
		
		Review r = new Review();
		request.setAttribute("list",list);
		request.setAttribute("list2",list2);
		request.setAttribute("pageBar2", pageBar2);
		
		request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request,response);
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
