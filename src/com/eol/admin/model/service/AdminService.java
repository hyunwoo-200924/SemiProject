package com.eol.admin.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.rollback;
import static com.eol.common.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import com.eol.admin.model.dao.AdminDao;
import com.eol.qna.model.vo.Paging;
import com.eol.qna.model.vo.Qna;

public class AdminService {
	
	AdminDao aDao = new AdminDao();

	public int getListCount() {
		Connection conn = getConnection();
		
		int result = aDao.getListCount(conn);
		
		close(conn);
		
		return result;
	}

	public List<Qna> selectQna(Paging pg) {
		Connection conn = getConnection();
		
		List<Qna> list = aDao.selectQna(conn, pg);
		
		close(conn);
		
		return list;
	}

	public int insertAnswer(String aId, int qNo, String answer) {
		Connection conn = getConnection();
		
		int result = aDao.insertAnswer(conn, aId, qNo, answer);
		
		if(result > 0) {
			result = aDao.updateMemberQna(conn, qNo);
			commit(conn);
		} else {
			rollback(conn);
		}
		
		close(conn);
		
		return result;
	}

}
