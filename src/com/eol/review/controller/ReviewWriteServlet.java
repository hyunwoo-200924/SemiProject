package com.eol.review.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.review.model.vo.Review;

 
@WebServlet("/review/reviewWrite")
public class ReviewWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     
    public ReviewWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int odoNo = Integer.parseInt(request.getParameter("odoNo").trim());
		int odpNo = Integer.parseInt(request.getParameter("odpNo").trim());
		String pName = request.getParameter("pName");
		String mName = request.getParameter("mName");
		
		
		request.setAttribute("odoNo",odoNo);
		request.setAttribute("odpNo",odpNo);
		request.setAttribute("pName", pName);
		request.setAttribute("mName", mName);
		
		System.out.println("이름 : " + request.getParameter("pName"));
		
		request.getRequestDispatcher("/views/review/reviewWrite.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}