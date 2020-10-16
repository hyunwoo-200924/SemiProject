package com.eol.order.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.vo.Member;
import com.eol.order.model.service.OrderService;
import com.eol.order.model.vo.WishList;
import com.eol.qna.model.service.QnaService;
import com.eol.qna.model.vo.Paging;

/**
 * Servlet implementation class WishListViewServlet
 */
@WebServlet("/wishListView")
public class WishListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public WishListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Member m = (Member)request.getSession().getAttribute("loginMember");
		int mNo = m.getmNo();
		
		//페이징 처리
		int listCount = new OrderService().getListCount(mNo);//총 찜 수
		System.out.println(listCount);
		
		int currentPage = 1; //현재페이지(뷰에서 받아올 거야,, 근데 첫페이지라면 뷰에서 받아온게 없으니까 1로 셋팅)
		if(request.getParameter("currentPage") != null) {
			currentPage = Integer.parseInt(request.getParameter("currentPage"));
		}
		
		int pageLimit = 5; //화면에 표시될 페이징 수
		int numPerPage = 2; //한 화면에 표시될 리스트 수
		int maxPage = (int)Math.ceil((double)listCount/numPerPage);
		int startPage = (currentPage-1) / pageLimit * pageLimit + 1;
		int endPage =  startPage + pageLimit - 1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		
		Paging pg = new Paging(listCount, currentPage, pageLimit, numPerPage, maxPage, startPage, endPage);
		
		//위시리스트 받아오기
		List<WishList> list = new OrderService().selectJjim(pg, mNo);
		
		request.setAttribute("WishList", list);
		request.setAttribute("pg", pg);
		request.getRequestDispatcher("/views/order/wishList_hy.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
