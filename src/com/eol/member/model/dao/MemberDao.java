package com.eol.member.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.eol.member.model.vo.Member;

public class MemberDao {
	
	Properties prop = new Properties();	
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/member/member.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Member selectMember(Connection conn, String userId, String password) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMember"));
			pstmt.setString(1, userId);
			pstmt.setString(2, password);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setmNo(rs.getInt("mNo"));
				m.setmId(rs.getString("mId"));
				m.setmPw(rs.getString("mPw"));
				m.setmPw(rs.getString("mName"));
				m.setmBirth(rs.getDate("mBirth"));
				m.setmEmail(rs.getString("mEmail"));
				m.setmPhone(rs.getString("mPhone"));
				m.setmAddress(rs.getString("mAddress"));
				m.setmGender(rs.getString("mGender"));
				m.setmLevel(rs.getInt("mLevel"));
				m.setmBuy(rs.getInt("mBuy"));
				m.setmDrop(rs.getInt("mDrop"));
				m.setmEdate(rs.getDate("mEdate"));
				m.setmPonint(rs.getInt("mPoint"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
	}
	
	public int insertMember(Connection conn, Member m) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertMember"));
			pstmt.setString(1, m.getmId());;
			pstmt.setString(2, m.getmPw());
			pstmt.setString(3, m.getmName());
//			pstmt.setDate(4, m.getmBirth());
			pstmt.setString(4, m.getmEmail());
			pstmt.setString(5, m.getmPhone());
			pstmt.setString(6, m.getmAddress());
			pstmt.setString(7, m.getmGender());
			
			System.out.println("3");
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	

}
