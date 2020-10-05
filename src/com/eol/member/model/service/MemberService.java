package com.eol.member.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.eol.member.model.dao.MemberDao;
import com.eol.member.model.vo.Member;

public class MemberService {

	MemberDao mDao = new MemberDao();
	
	public Member selectMember(String userId, String password) {
		Connection conn = getConnection();
		Member m = mDao.selectMember(conn,userId,password);
		return m;
	}
	
	public int insertMember(Member m) {
		Connection conn = getConnection();
		System.out.println("2");
		int result = new MemberDao().insertMember(conn, m);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
		
	}
	
}
