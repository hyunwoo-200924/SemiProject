package com.eol.notice.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import static com.eol.common.JDBCTemplate.close;
import com.eol.notice.model.vo.Notice;

public class NoticeDao {
	
	private Properties prop=new Properties();
	
	public NoticeDao() {
		try {
			String path=NoticeDao.class.getResource("/notice/notice.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	//공지게시판 뷰
	public Notice selectNoticeOne(Connection conn, int no) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Notice n=null;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectNoticeOne"));
			pstmt.setInt(1,no);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				n=new Notice();
				n.setnNumber(rs.getInt("nno"));
				n.setnWriter(rs.getNString("nwriter"));
				n.setnTitle(rs.getNString("ntitle"));
				n.setFilePath(rs.getNString("nfile"));
				n.setnContent(rs.getNString("ncontent"));
				n.setnRdate(rs.getDate("nRdate"));
				n.setnHit(rs.getInt("nhit"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return n;
		
		
		
	}
	public int insertNotice(Connection conn, Notice n) {
			PreparedStatement pstmt=null;
			int result=0;
			try {
				pstmt=conn.prepareStatement("insertNotice");
				pstmt.setNString(1, n.getnWriter());
				pstmt.setNString(2,n.getnTitle());
				pstmt.setNString(3, n.getnContent());
				pstmt.setNString(4, n.getFilePath());
				pstmt.setDate(5, n.getnRdate());
				result=pstmt.executeUpdate();
				
			}catch(SQLException e) {
				e.printStackTrace();
			}finally {
				close(pstmt);
			}return result;
	}
	public List<Notice> noticeList(Connection conn, int cPage, int numPerPage) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List<Notice> list=new ArrayList();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("noticeList"));
			pstmt.setInt(1,(cPage)*numPerPage+1);
			pstmt.setInt(2, cPage*numPerPage);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Notice n=new Notice();
				n.setnNumber(rs.getInt("nno"));
				n.setnTitle(rs.getNString("ntitle"));
				n.setnWriter(rs.getNString("nwriter"));
				n.setnContent(rs.getNString("ncontent"));
				n.setFilePath(rs.getString("nfile"));
				n.setnRdate(rs.getDate("nrdate"));
				n.setnHit(rs.getInt("nhit"));
				list.add(n);
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	public int noticeCount(Connection conn) {
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("nhit"));
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
