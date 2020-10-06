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
	public Member searchMemberId(Connection conn, String findName, String findEmail) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member m = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("searcMemberId"));
			pstmt.setString(1,findName);
			pstmt.setString(2,findEmail);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				m = new Member();
				m.setmId(rs.getString("m_Id"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return m;
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
				m.setmNo(rs.getInt("m_No"));
				m.setmId(rs.getString("m_Id"));
				m.setmPw(rs.getString("m_Pw"));
				m.setmName(rs.getString("m_Name"));
				m.setmBirth(rs.getString("m_Birth"));
				m.setmEmail(rs.getString("m_Email"));
				m.setmPhone(rs.getString("m_Phone"));
				m.setmAddress(rs.getString("m_Address"));
				m.setmGender(rs.getString("m_Gender"));
				m.setmLevel(rs.getInt("m_Level"));
				m.setmBuy(rs.getInt("m_Buy"));
				m.setmDrop(rs.getInt("m_Drop"));
				m.setmEdate(rs.getDate("m_Edate"));
				m.setmPonint(rs.getInt("m_Point"));
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
