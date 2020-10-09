package com.eol.member.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.member.model.vo.Point;


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
	
	public List<Point> selectpointlist(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Point> pointlist = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectpointlist"));
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Point p = new Point();
				p.setmNo(rs.getInt("m_no"));
				p.setPoStatus(rs.getString("po_status"));
				p.setPoNo(rs.getInt("po_no"));
				p.setPoDate(rs.getDate("po_date"));
				p.setPoPoint(rs.getInt("po_point"));
				pointlist.add(p);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return pointlist;
		
	}
}
