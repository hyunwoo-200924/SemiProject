package com.eol.member.model.service;

import static com.eol.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.eol.member.model.dao.CouponDao;

public class CouponService {
	
	CouponDao dao = new CouponDao();
	
	public int countCoupon(int mNo) {
		Connection conn = getConnection();
		int coCount = dao.couponCount(conn, mNo);
		return coCount;
	}
	

}
