package com.eol.qna.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.qna.model.vo.Paging;
import com.eol.qna.model.vo.Qna;

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

	//1:1 문의 작성하기
	public int insertQna(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println("dao"+q);
		
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

	//문의 리스트 가져오기 (페이징 처리 한거)
	public List<Qna> selectQna(Connection conn, Paging pg, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Qna> list = new ArrayList<Qna>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQnaList"));
			
			int startRow = (pg.getCurrentPage() - 1) * pg.getNumPerPage() + 1;
			int endRow = pg.getCurrentPage() * pg.getNumPerPage();
			
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
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

//	//문의 리스트 가져오기
//	public List<Qna> selectQna(Connection conn, int mNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<Qna> list = new ArrayList<Qna>();
//		
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("selectQnaList"));
//			pstmt.setInt(1, mNo);
//			
//			rs = pstmt.executeQuery();
//			
//			while(rs.next()) {
//				Qna q = new Qna();
//				
//				q.setqNo(rs.getInt("q_no"));
//				q.setoNo(rs.getInt("o_no"));
//				q.setqCategory(rs.getString("q_category"));
//				q.setqTitle(rs.getString("q_title"));
//				q.setqContent(rs.getString("q_content"));
//				q.setqFile(rs.getString("q_file"));
//				q.setqRdate(rs.getDate("q_rdate"));
//				q.setmNo(mNo);
//				q.setqAnswer(rs.getString("q_answer"));
//				q.setqStatus(rs.getString("q_status"));
//				
//				list.add(q);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		return list;
//	}

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

	//1:1 문의 총 갯수
	public int getListCount(Connection conn, int mNo) {
		//select count(*) from qna where m_no=1;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getListCount"));
			pstmt.setInt(1, mNo);
			
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

	//1:1문의 답변 가져오기
	public String[] selectAnswer(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] answer_date = new String[2];
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectAnswer"));
			pstmt.setInt(1, qNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				answer_date[0] = rs.getString(1);
				answer_date[1] = rs.getString(2);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return answer_date;
	}

	//1:1 문의 수정할 때  수정정보 가져오기
	public Qna selectQuestionView(Connection conn, int qNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Qna q = null;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectQuestionView"));
			pstmt.setInt(1, qNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				q = new Qna();
				
				q.setqNo(rs.getInt("q_no"));
				q.setoNo(rs.getInt("o_no"));
				q.setqCategory(rs.getString("q_category"));
				q.setqTitle(rs.getString("q_title"));
				q.setqContent(rs.getString("q_content"));
				q.setqFile(rs.getString("q_file"));
				q.setqRdate(rs.getDate("q_rdate"));
				q.setmNo(rs.getInt("m_no"));
				q.setqAnswer(rs.getString("q_answer"));
				q.setqStatus(rs.getString("q_status"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return q;
	}

	//1:1문의 수정하기
	public int updateQuestion(Connection conn, Qna q) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			if(q.getoNo() == 0) { //주문번호 선택 안했을 때
				System.out.println("선택ㄴㄴ");
				pstmt = conn.prepareStatement(prop.getProperty("updateQuestion_order_no"));
				pstmt.setString(1, q.getqCategory());
				pstmt.setString(2, q.getqTitle());
				pstmt.setString(3, q.getqContent());
				pstmt.setString(4, q.getqFile());
				pstmt.setString(5, q.getqAnswer());
				pstmt.setInt(6, q.getqNo());
			} else {
				System.out.println("선택ㅇㅇ");
				pstmt = conn.prepareStatement(prop.getProperty("updateQuestion_order_yes"));
				pstmt.setInt(1, q.getoNo());
				pstmt.setString(2, q.getqCategory());
				pstmt.setString(3, q.getqTitle());
				pstmt.setString(4, q.getqContent());
				pstmt.setString(5, q.getqFile());
				pstmt.setString(6, q.getqAnswer());
				pstmt.setInt(7, q.getqNo());
			}
			result = pstmt.executeUpdate();
			System.out.println("dao"+result);
		} catch (SQLException e) {
			
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		
		return result;		
	}
	
	
}
