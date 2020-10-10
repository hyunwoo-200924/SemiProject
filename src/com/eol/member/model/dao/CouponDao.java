package com.eol.member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.member.model.vo.Coupon;

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
			//couponCount=SELECT COUNT(*) FROM COUPON WHERE M_NO=?
			pstmt.setInt(1, mNo);
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

	public List<Coupon> selectCoupon(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Coupon> list = new ArrayList<Coupon>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectCoupon"));
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Coupon c = new Coupon();
				c.setmNo(rs.getInt("M_NO"));
				c.setCoType(rs.getInt("CO_TYPE"));
				c.setCoContent(rs.getInt("CO_CONTENT"));
				c.setCoName(rs.getString("CO_NAME"));
				c.setCoStatus(rs.getString("CO_STATUS"));
				c.setCoRDate(rs.getDate("CO_RDATE"));
				
				list.add(c);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

}
