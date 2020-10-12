package com.eol.admin.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.admin.model.service.AdminService;
import com.eol.qna.model.vo.Paging;
import com.eol.qna.model.vo.Qna;

/**
 * Servlet implementation class BoardManagementViewServlet
 */
@WebServlet("/adminQuestionList")
public class BoardManagementViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardManagementViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int listCount = new AdminService().getListCount();//총 문의 수
		System.out.println(listCount);
		
		int currentPage = 1; //현재페이지(뷰에서 받아올 거야,, 근데 첫페이지라면 뷰에서 받아온게 없으니까 1로 셋팅)
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int pageLimit = 5; //화면에 표시될 페이징 수
		int numPerPage = 5; //한 화면에 표시될 리스트 수
		int maxPage = (int)Math.ceil((double)listCount/numPerPage);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage =  startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Paging pg = new Paging(listCount, currentPage, pageLimit, numPerPage, maxPage, startPage, endPage);
		
		//1:1 문의 리스트 받아오기
		List<Qna> list = new AdminService().selectQna(pg);
		
		System.out.println(list);
		
		request.setAttribute("list", list);
		request.setAttribute("pg", pg);
		request.getRequestDispatcher("/views/admin/boardManagement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
