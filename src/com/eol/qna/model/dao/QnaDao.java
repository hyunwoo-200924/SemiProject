package com.eol.qna.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.qna.model.vo.Qna;
import static com.eol.common.JDBCTemplate.close;

public class QnaDao {

	private Properties prop = new Properties();
	
	public QnaDao() {
		
		String path = QnaDao.class.getResource("/qna/qna.properties").getPath();
		try {
			prop.load(new FileReader(path));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public int insertQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			if(q.getoNo() == 0) { //주문번호 선택 안했을 때
				pstmt = conn.prepareStatement(prop.getProperty("insertQna_order_no"));
				pstmt.setString(1, q.getqCategory());
				pstmt.setString(2, q.getqTitle());
				pstmt.setString(3, q.getqContent());
				pstmt.setString(4, q.getqFile());
				pstmt.setInt(5, q.getmNo());
				pstmt.setString(6, q.getqAnswer());
			} else {
				pstmt = conn.prepareStatement(prop.getProperty("insertQna_order_yes"));
				pstmt.setInt(1, q.getoNo());
				pstmt.setString(2, q.getqCategory());
				pstmt.setString(3, q.getqTitle());
				pstmt.setString(4, q.getqContent());
				pstmt.setString(5, q.getqFile());
				pstmt.setInt(6, q.getmNo());
				pstmt.setString(7, q.getqAnswer());
			}
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(3);
		return result;
	}

	//문의 리스트 가져오기
	public List<Qna> selectQna(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList<Qna>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQnaList"));
			pstmt.setInt(1, mNo);
			
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
				q.setmNo(mNo);
				q.setqAnswer(rs.getString("q_answer"));
				q.setqStatus(rs.getString("q_status"));
				
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

	//문의 지우기
	public int deleteQna(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteQna"));
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
