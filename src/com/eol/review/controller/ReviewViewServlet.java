package com.eol.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.review.model.service.ReviewService;
import com.eol.review.model.vo.Review;


/**
 * Servlet implementation class NoticeViewServlet
 */
@WebServlet("/review/reviewView")
public class ReviewViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		int no=Integer.parseInt(request.getParameter("no"));
		
		Review r=new ReviewService().selectReview(no);
		
		String msg="";
		String loc="";
		String path="";
		if(r==null) {
			//선택한 공지사항이 삭제됨 (게시글 없음)
			msg="선택한 공지사항이 존재하지 않습니다.";
			loc="/review/reviewList";
			path = "/views/common/msg.jsp";
			request.setAttribute("msg", msg);
			request.setAttribute("loc", loc);
		}else {			
			//선택된 공지사항이 있어서 상세페이지로 넘어감
			request.setAttribute("review", r);
			path="/views/review/reviewView.jsp";
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
