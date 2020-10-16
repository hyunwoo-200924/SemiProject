package com.eol.review.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.review.model.service.ReviewService;
import com.eol.review.model.vo.Review;

/**
 * Servlet implementation class ReviewSelectDateServlet
 */
@WebServlet("/review/reviewSelectDate")
public class ReviewSelectDateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewSelectDateServlet() {
        super();
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
		
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		
		List<Review> list=new ReviewService().reviewPullList(cPage,numPerPage,mNo);
		List<Review> list2 = new ArrayList();
		String ydate = request.getParameter("ydate");
		
		if(ydate.equals("1")) {
			ydate = "20/09/16";
			list2=new ReviewService().selectDate(cPage,numPerPage, ydate, mNo);
			request.setAttribute("list2",list2);
		}else if(ydate.equals("3")) {
			ydate = "20/07/16";
			list2=new ReviewService().selectDate(cPage,numPerPage, ydate, mNo);
			request.setAttribute("list2",list2);
		}else if(ydate.equals("6")) {
			ydate = "20/04/16";
			list2=new ReviewService().selectDate(cPage,numPerPage, ydate, mNo);
			request.setAttribute("list2",list2);
		}else if(ydate.equals("10")) {
			ydate = "19/01/16";
			list2=new ReviewService().selectDate(cPage,numPerPage, ydate, mNo);
			request.setAttribute("list2",list2);
		}
		//값에 따라 다른 리스트 받아서 list에 저장
		
		
		int totalData2=new ReviewService().reviewCount();
		
		int totalPage2=(int)Math.ceil((double)totalData2/numPerPage);
		int pageBarSize=5;
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		String pageBar2="";
		if(pageNo==1) {
			pageBar2+="<span>[이전]</span>";
			
		}else {
			pageBar2+="<a href='"+request.getContextPath()+"/review/reviewList?cPage2="+(pageNo-1)+"'>[이전]</a>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage2)) {
			if(pageNo==cPage) {
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
