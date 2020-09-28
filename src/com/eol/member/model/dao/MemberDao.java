package com.eol.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Properties;

import com.eol.member.model.vo.Member;
import static com.eol.common.JDBCTemplate.close;

public class MemberDao {
	
	Properties prop = new Properties();	
	
	public MemberDao() {
		try {
			String path=MemberDao.class.getResource("/sql/member/member_sql.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
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
