package com.eol.member.controller;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.MemberService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MemberEnrollCheckedEndServlet
 */
@WebServlet("/memberEnrollCheck.do")
public class MemberEnrollCheckedEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberEnrollCheckedEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//클라이언트한테 이름, 생년월일 , 전화번호 정보를 가져옴
		String joinName = request.getParameter("joinName");
		String joinPhone = request.getParameter("joinPhone");
		
		//정보 담기
		Member m = new MemberService().checkedMemberEnroll(joinName,joinPhone);
		//조건문으로 회원 등록 여부 페이지 전환 해주기
		String resutlId="";
		if(m != null) {
			//등록되어 있는 회원
			resutlId=m.getmId();
			int length = resutlId.length()-2;
			String afterId = resutlId.substring(0,length);
			afterId= afterId+"**";
			resutlId = afterId;
			request.setAttribute("checkedMemberId", resutlId);
			request.getRequestDispatcher("/views/member/memberEnrollResult.jsp").forward(request, response);
		
		}else{
			//등록되어 있지 않다면
			request.setAttribute("checkedMemberId", resutlId);
			request.getRequestDispatcher("/views/member/memberEnrollResult.jsp").forward(request, response);
			
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
