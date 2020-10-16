package com.eol.review.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.Document;

import com.eol.member.model.vo.Member;
import com.eol.review.model.service.ReviewService;
import com.eol.review.model.vo.Review;

/**
 * Servlet implementation class ReviewDeleteServlet
 */
@WebServlet("/review/reviewDelete")
public class ReviewDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		Review r = new Review();
		int oNo = Integer.parseInt(request.getParameter("oNo").trim());
		int pNo = Integer.parseInt(request.getParameter("pNo").trim());
		
		int result = new ReviewService().reviewDelete(r, oNo, pNo);
		
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
		List<Review> list2=new ReviewService().reviewList(cPage,numPerPage, mNo);
		int totalData=new ReviewService().reviewCount();
		
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
		
		if (result > 0) {
			System.out.println("삭제 성공");
			
			if(r.getmImage()==null) {
				m.setmPonint(m.getmPonint() - 200);	
			}else {
			m.setmPonint(m.getmPonint() - 500);
			}
			
			int mPoint = m.getmPonint();
			int rp = new ReviewService().updatePoint(mPoint, mNo);
			if(rp>0) {
			}
			
			request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("/views/review/reviewList.jsp").forward(request, response); }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
