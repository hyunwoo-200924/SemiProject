package com.eol.admin.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.admin.model.service.AdminService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class AnswerEnrollServlet
 */
@WebServlet("/answerEnroll")
public class AnswerEnrollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AnswerEnrollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int qNo = Integer.parseInt(request.getParameter("d"));
		String answer = request.getParameter("answer");
		String aId = ((Member)request.getSession().getAttribute("loginMember")).getmId();
		System.out.println(qNo + " " + answer + " " + aId);
		
		int result = new AdminService().insertAnswer(aId, qNo, answer);
		
		if(result > 0) {
			request.setAttribute("msg", "답변이 등록되었습니다.");
			request.setAttribute("loc", "/adminQuestionList");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);;
			//response.sendRedirect(request.getContextPath() + "/adminQuestionList");
		} else {
			request.setAttribute("msg", "답변 등록에 실패하였습니다.");
			request.getRequestDispatcher("/adminQuestionList").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
