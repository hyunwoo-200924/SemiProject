package com.eol.qna.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.eol.member.model.vo.Member;
import com.eol.qna.model.service.QnaService;
import com.eol.qna.model.vo.Qna;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

/**
 * Servlet implementation class UpdateQuestionServlet
 */
@WebServlet("/updateQuestion")
public class UpdateQuestionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateQuestionServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if(!ServletFileUpload.isMultipartContent(request)) {
			request.setAttribute("msg", "1:1문의 작성 오류[form:enctype에러] 고객센터로 문의바랍니다.");
			request.setAttribute("loc", "/");
			request.getRequestDispatcher("/views/common/msg.jsp").forward(request, response);
			return;
		}
		
		String path = getServletContext().getRealPath("/upload/question");
		int maxSize = 1024 * 1024 * 10; //10MB
		String encode = "UTF-8";
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		MultipartRequest mr = new MultipartRequest(request, path, maxSize, encode, rename);
		
		
		Qna q = new Qna();
		
		q.setqNo(Integer.parseInt(mr.getParameter("qNo")));
		q.setqCategory(mr.getParameter("qnaCategory"));
		q.setqTitle(mr.getParameter("title"));
		String oNo = mr.getParameter("o_no");
		System.out.println(oNo);
		if(!oNo.equals("")) {
			q.setoNo(Integer.parseInt(oNo));
		}
		q.setqContent(mr.getParameter("content"));
		q.setqFile(mr.getFilesystemName("file"));
		if(mr.getParameter("answer") != "") {
			q.setqAnswer(mr.getParameter("answer"));
		}
		System.out.println(mr.getParameter("answer"));
		//q.setmNo(1);//아래줄 대신 확인용
		q.setmNo(((Member)request.getSession().getAttribute("loginMember")).getmNo());

		System.out.println(q);
		
		int result = new QnaService().updateQuestion(q);
		System.out.println("이거" + result);
		
		String msg = "";
		String loc = "/questionList";
		if(result > 0) {
			request.setAttribute("msg", "정상적으로 수정되었습니다.");
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
