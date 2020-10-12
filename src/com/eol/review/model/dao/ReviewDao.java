package com.eol.review.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.review.model.vo.Review;

public class ReviewDao {
	
	private Properties prop=new Properties();
	
	public ReviewDao() {
		try {
			String path = ReviewDao.class.getResource("/review/review.properties").getPath();
			prop.load(new FileReader(path));
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public Review selectReview(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Review r = null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectReview"));
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				r = new Review();
				r.setrNo(rs.getInt("R_NO"));
				r.setpNo(rs.getInt("P_NO"));
				r.setoNo(rs.getInt("O_NO"));
				r.setrWriter(rs.getString("R_WRITER"));
				r.setrTitle(rs.getString("R_TITLE"));
				r.setrContent(rs.getString("R_CONTENT"));
				r.setrPhoto1(rs.getString("R_PHOTO1"));
				r.setrPhoto2(rs.getString("R_PHOTO2"));
				r.setrPhoto3(rs.getString("R_PHOTO3"));
				r.setrRdate(rs.getDate("R_RDATE"));
				r.setrStarScore(rs.getInt("R_STARSCORE"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r;
	}
////	 p_no o_no 가져오기
//	public int[] pullReview(Connection conn, int mNo) {
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		int[] nResult = null;
//		
//		try {
//			pstmt = conn.prepareStatement(prop.getProperty("pullReview"));
//			
//			if(rs.next()) {
//				pstmt.setInt(rs.getInt("p_no"), mNo);
//			}
//		}
//	}
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertReview"));
			pstmt.setString(1, r.getrTitle());
			pstmt.setString(2, r.getrContent());
			
			result=pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	public List<Review> reviewList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Review> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("reviewList"));
			pstmt.setInt(1,(cPage-1)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Review r=new Review();
				r.setrNo(rs.getInt("R_NO"));
				r.setpNo(rs.getInt("P_NO"));
				r.setoNo(rs.getInt("O_NO"));
				r.setrWriter(rs.getString("R_WRITER"));
				r.setrTitle(rs.getString("R_TITLE"));
				r.setrContent(rs.getString("R_CONTENT"));
				r.setrPhoto1(rs.getString("R_PHOTO1"));
				r.setrPhoto2(rs.getString("R_PHOTO2"));
				r.setrPhoto3(rs.getString("R_PHOTO3"));
				r.setrRdate(rs.getDate("R_RDATE"));
				r.setrStarScore(rs.getInt("R_STARSCORE"));
				list.add(r);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	public int reviewCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("reviewCount"));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				result=rs.getInt("cnt");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
