package com.eol.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.qna.model.service.QnaService;
import com.eol.qna.model.vo.Qna;

/**
 * Servlet implementation class UpdateQuestionViewServlet
 */
@WebServlet("/updateQuestionView")
public class UpdateQuestionViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuestionViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1:1문의 수정하는 화면으로 전환
		int qNo = Integer.parseInt(request.getParameter("qNo"));
		
		Qna q = new QnaService().selectQuestionView(qNo);
		
		request.setAttribute("q", q);
		request.getRequestDispatcher("views/question/updateQuestion.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
