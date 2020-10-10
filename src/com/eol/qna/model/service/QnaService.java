package com.eol.qna.model.service;

import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.eol.qna.model.dao.QnaDao;
import com.eol.qna.model.vo.Qna;

public class QnaService {

	private QnaDao qDao = new QnaDao();

	public int insertQna(Qna q) {
		
		Connection conn = getConnection();
		
		int result = qDao.insertQna(conn, q);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		System.out.println(2);
		return result;
		
	}

	public List<Qna> selectQna(int mNo) {
		
		Connection conn = getConnection();
		
		List<Qna> list = qDao.selectQna(conn, mNo);
		
		close(conn);
		
		return list;
	}

	public int deleteQna(int qNo) {
		Connection conn = getConnection();
		
		int result = qDao.deleteQna(conn, qNo);
		
		close(conn);
		
		return result;
	} 
}
