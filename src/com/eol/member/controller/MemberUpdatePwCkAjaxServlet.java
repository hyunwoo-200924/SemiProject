package com.eol.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.eol.member.model.service.MemberService;
import com.eol.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdatePwCkAjaxServlet
 */
@WebServlet("/MemberUpdatePwCkAjax")
public class MemberUpdatePwCkAjaxServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdatePwCkAjaxServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//Member m = new Member("asdf");
		//request.getSession().setAttribute("loginMember", m);
		String id = ((Member)request.getSession().getAttribute("loginMember")).getmId();
		System.out.println(id);
		String dbpw = new MemberService().selectMemberPw(id);
		System.out.println(dbpw);
		
		response.getWriter().print(dbpw);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
