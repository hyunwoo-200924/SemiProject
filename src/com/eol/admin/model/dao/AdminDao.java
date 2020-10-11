package com.eol.admin.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.qna.model.dao.QnaDao;
import com.eol.qna.model.vo.Paging;
import com.eol.qna.model.vo.Qna;

public class AdminDao {
	
	private Properties prop = new Properties();
	
	public AdminDao() {
		
		String path = QnaDao.class.getResource("/admin/admin.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int getListCount(Connection conn) {
		//select count(*) from qna
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getListCount"));
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}

	public List<Qna> selectQna(Connection conn, Paging pg) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList<Qna>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQnaList"));
			
			int startRow = (pg.getCurrentPage() - 1) * pg.getNumPerPage() + 1;
			int endRow = pg.getCurrentPage() * pg.getNumPerPage();
			
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Qna q = new Qna();
				
				q.setqNo(rs.getInt("q_no"));
				q.setoNo(rs.getInt("o_no"));
				q.setqCategory(rs.getString("q_category"));
				q.setqTitle(rs.getString("q_title"));
				q.setqContent(rs.getString("q_content"));
				q.setqFile(rs.getString("q_file"));
				q.setqRdate(rs.getDate("q_rdate"));
				q.setmNo(rs.getInt("M_NO"));
				q.setqAnswer(rs.getString("q_answer"));
				q.setqStatus(rs.getString("q_status"));
				q.setmId(rs.getString("m_id"));
				
				list.add(q);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}

	public int insertAnswer(Connection conn, String aId, int qNo, String answer) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertAnswer"));
			pstmt.setInt(1, qNo);
			pstmt.setString(2, aId);
			pstmt.setString(3, answer);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
		
	}

	public int updateMemberQna(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateMemberQna"));
			pstmt.setInt(1, qNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;
	}

}
