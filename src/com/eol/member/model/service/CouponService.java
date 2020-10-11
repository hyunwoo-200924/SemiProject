package com.eol.member.model.service;

import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.eol.member.model.dao.CouponDao;
import com.eol.member.model.vo.Coupon;

public class CouponService {
	
	CouponDao dao = new CouponDao();
	
	public int countCoupon(int mNo) {
		Connection conn = getConnection();
		int coCount = dao.couponCount(conn, mNo);
		return coCount;
	}
	
	//쿠폰 리스트 가져오기
	public List<Coupon> selectCoupon(int mNo) {
		Connection conn = getConnection();
		
		List<Coupon> list = dao.selectCoupon(conn, mNo);
		
		close(conn);
		
		return list;
	}

}
