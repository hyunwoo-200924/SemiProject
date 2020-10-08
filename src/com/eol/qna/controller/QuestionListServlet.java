package com.eol.qna.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.qna.model.service.QnaService;
import com.eol.qna.model.vo.Qna;

/**
 * Servlet implementation class QuestionListServlet
 */
@WebServlet("/questionList")
public class QuestionListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int mNo = 1; //확인용 아래줄 대신
		//int mNo = ((Member)request.getSession().getAttribute("loginMember")).getmNo();
		
		List<Qna> list = new QnaService().selectQna(mNo);
		
		for(Qna q : list) {
			
		}
		
		System.out.println(list);
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("/views/question/questionList.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
