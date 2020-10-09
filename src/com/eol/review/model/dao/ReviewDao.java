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
				r.setrNo(rs.getInt("rNo"));
				r.setpNo(rs.getInt("pNo"));
				r.setoNo(rs.getInt("oNo"));
				r.setrWriter(rs.getString("rWriter"));
				r.setrPw(rs.getString("rRw"));
				r.setrTitle(rs.getString("rTitle"));
				r.setrContent(rs.getString("rContent"));
				r.setrPhoto1(rs.getString("rPhoto1"));
				r.setrPhoto2(rs.getString("rPhoto2"));
				r.setrPhoto3(rs.getString("rPhoto3"));
				r.setrRdate(rs.getDate("rRdate"));
				r.setrStarScore(rs.getInt("rStarScore"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return r;
	}
	
	public int insertReview(Connection conn, Review r) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement("insertReview");
			pstmt.setInt(1, r.getpNo());
			pstmt.setInt(2, r.getoNo());
			pstmt.setString(3, r.getrWriter());
			pstmt.setString(4, r.getrPw());
			pstmt.setString(5, r.getrTitle());
			pstmt.setString(6, r.getrContent());
			pstmt.setString(7, r.getrPhoto1());
			pstmt.setString(8, r.getrPhoto2());
			pstmt.setString(9,  r.getrPhoto3());
			pstmt.setInt(10, r.getrStarScore());
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
				r.setrNo(rs.getInt("rNo"));
				r.setpNo(rs.getInt("pNo"));
				r.setoNo(rs.getInt("oNo"));
				r.setrWriter(rs.getString("rWriter"));
				r.setrPw(rs.getString("rPw"));
				r.setrTitle(rs.getString("rTitle"));
				r.setrContent(rs.getString("rContent"));
				r.setrPhoto1(rs.getString("rPhoto1"));
				r.setrPhoto2(rs.getString("rPhoto2"));
				r.setrPhoto3(rs.getString("rPhoto3"));
				r.setrRdate(rs.getDate("rRdate"));
				r.setrStarScore(rs.getInt("rStarScore"));
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
