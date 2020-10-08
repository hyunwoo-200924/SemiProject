package com.eol.qna.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.qna.model.service.QnaService;
import com.eol.qna.model.vo.Qna;

/**
 * Servlet implementation class QuestionListViewServlet
 */
@WebServlet("/questionWrite")
public class QuestionWriteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionWriteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Qna q = new Qna();
		q.setqCategory(request.getParameter("category"));
		q.setqTitle(request.getParameter("title"));
		String oNo = request.getParameter("o_no");
		if(oNo != "") {
			q.setoNo(Integer.parseInt(oNo));
		}
		q.setqContent(request.getParameter("content"));
		q.setqFile(request.getParameter("file"));
		q.setqAnswer(request.getParameter("answer"));
		q.setmNo(1);//아래줄 대신 확인용
		//q.setmNo(((Member)request.getSession().getAttribute("loginMember")).getmNo());
		System.out.println(q);
		int result = new QnaService().insertQna(q);
		
		String msg = "";
		String loc = "/questionList";
		if(result > 0) {
			request.setAttribute("msg", "정상적으로 등록되었습니다.");
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "등록에 실패하였습니다.");
			request.setAttribute("loc", loc);
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
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
