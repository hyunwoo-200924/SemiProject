package com.eol.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import static com.eol.common.JDBCTemplate.close;

public class CouponDao {

	Properties prop = new Properties();
	
	public CouponDao() {
	
		try {			
			String path = CouponDao.class.getResource("/coupon/coupon.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public int couponCount(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int coCount = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("couponCount"));
			rs = pstmt.executeQuery();
			if(rs.next()) {
				coCount = rs.getInt("count(*)");
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return coCount;
	}

}
