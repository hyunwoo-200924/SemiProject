package com.eol.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.eol.member.model.service.MemberService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MemberFindIdEndServlet
 */
@WebServlet("/findidEnd.do")
public class MemberFindIdEndServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberFindIdEndServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//아이디 찾기 서비스 구현
		//1. 클라이언트가 보낸 id ,email을 받아옴
		String findName = request.getParameter("findName");
		String findEmail = request.getParameter("findEmail");
		System.out.println(findName+findEmail);
		
		// 받아온 id, email이 DB의 Member테이블에 있는지 확인
		Member m = new MemberService().searchMemberId(findName,findEmail);
		String resutlId="";
		//객체 m 값이 null이면  -> 찾는 아이디가 없음
		//객체 m 값이 null이 아니면 -> 아이디 페이지를 보여줌
		System.out.println(m);
		if(m != null) {
			//아이디 찾기 성공
			 resutlId = m.getmId();
			int length = resutlId.length()-2;
			String afterId = resutlId.substring(0,length);
			afterId= afterId+"**";
			resutlId = afterId;
			request.setAttribute("searchMemberId", resutlId);
			request.getRequestDispatcher("/views/member/memberFindIdResult.jsp").forward(request, response);
		
		}else{
			//아이디 찾기 실패
			request.getRequestDispatcher("/views/member/memberFindIdResult.jsp").forward(request, response);
			
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
