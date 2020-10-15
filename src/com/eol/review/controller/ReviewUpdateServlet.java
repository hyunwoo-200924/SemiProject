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
@WebServlet("/review/reviewUpdate")
public class ReviewUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReviewUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		int mNo = Integer.parseInt(request.getParameter("mNo").trim());
		int rNo = Integer.parseInt(request.getParameter("rNo").trim());
		int odoNo = Integer.parseInt(request.getParameter("odoNo").trim());
		int odpNo = Integer.parseInt(request.getParameter("odpNo").trim());
		String pName = request.getParameter("pName");
		String mName = request.getParameter("mName");
		
		request.setAttribute("rNo",rNo);
		request.setAttribute("mNo",mNo);
		request.setAttribute("odoNo",odoNo);
		request.setAttribute("odpNo",odpNo);
		request.setAttribute("pName", pName);
		request.setAttribute("mName", mName);
		
		String rTitle = request.getParameter("rTitle");
		String rContent = request.getParameter("rContent");
		String mImage = request.getParameter("mImage");
		
		System.out.println("update : " + rNo);
		System.out.println("update : " + rTitle);
		System.out.println("update : " + rContent);
		System.out.println("update : " + mImage);
		
		request.setAttribute("rTitle", rTitle);
		request.setAttribute("rContent", rContent);
		request.setAttribute("mImage", mImage);
		
		
		List<Review> list2=new ReviewService().reviewList2(mNo);
		
		request.setAttribute("list2",list2);
		
		request.getRequestDispatcher("/views/review/reviewUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
}
