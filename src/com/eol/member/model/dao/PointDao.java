package com.eol.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.eol.member.model.vo.Point;
import static com.eol.common.JDBCTemplate.close;


public class PointDao {
	
	Properties prop = new Properties();
	
	public PointDao() {
		
		try {			
			String path = CouponDao.class.getResource("/point/point.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Point myPoint(Connection conn, int mNo) {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Point p = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("viewPoint"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				p = new Point();
				p.setmNO(rs.getInt("m_No"));
				p.setpGet(rs.getInt("po_get"));
				p.setpUse(rs.getInt("po_use"));
				p.setpTotal(rs.getInt("po_total"));
				p.setpStatus(rs.getString("po_status"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return p;
		
		
	}
}
