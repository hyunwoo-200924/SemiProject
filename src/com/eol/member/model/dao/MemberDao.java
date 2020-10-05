package com.eol.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.eol.member.model.vo.Member;
import static com.eol.common.JDBCTemplate.close;

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
					m.setmNo(rs.getInt("m_No"));
		            m.setmId(rs.getString("m_Id"));
		            m.setmPw(rs.getString("m_Pw"));
		            m.setmPw(rs.getString("m_Name"));
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
			pstmt.setString(4, m.getmBirth());
			pstmt.setString(5, m.getmEmail());
			pstmt.setString(6, m.getmPhone());
			pstmt.setString(7, m.getmAddress());
			pstmt.setString(8, m.getmGender());
			
			System.out.println("3");
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}
		return result;
	}
	
	//아이디 중복체크
	public int selectMemberId(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMemberId"));
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		
		return result;
	}

	//이메일 중복체크
	public int selectMemberEmail(Connection conn, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectEmailId"));
			pstmt.setString(1, email);
			
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

	//비밀번호 체크
	public String selectMemberPw(Connection conn, String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String dbpw = "";
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectMemberPw"));
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				dbpw = rs.getString(1);//디비 비밀번호가 담긴다.
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return dbpw;

	}
	
	//회원탈퇴
	public int deleteMember(Connection conn, String id) {
		PreparedStatement pstmt = null;
		int result = 0;
		System.out.println(id);
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteMember"));
			pstmt.setString(1, id);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

}
