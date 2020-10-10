package com.eol.qna.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.eol.qna.model.dao.QnaDao;
import com.eol.qna.model.vo.Paging;
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
	
	//1:1 문의 리스트 가져오기
	public List<Qna> selectQna(Paging pg, int mNo) {
		
		Connection conn = getConnection();
		
		List<Qna> list = qDao.selectQna(conn, pg, mNo);
		
		close(conn);
		
		return list;
	}

	public int deleteQna(int qNo) {
		Connection conn = getConnection();
		
		int result = qDao.deleteQna(conn, qNo);
		
		close(conn);
		
		return result;
	}

	//1:1문의 갯수
	public int getListCount(int mNo) {
		Connection conn = getConnection();
		
		int result = qDao.getListCount(conn, mNo);
		
		close(conn);
		
		return result;
	} 
}
