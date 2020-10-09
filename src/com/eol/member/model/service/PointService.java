package com.eol.member.model.service;

import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.eol.member.model.dao.PointDao;
import com.eol.member.model.vo.Point;

public class PointService {
	
	PointDao poDao = new PointDao(); 
	
	//회원 포인트 조회
	public List<Point> pointList(int mNo){
		//회원 포인트 조회 : 이미 로그인 되어 있는 회원의 번호를 가져옴.
		Connection conn =getConnection();
		List<Point> list = poDao.selectpointlist(conn,mNo);
		close(conn);
		return list;
		
		
	}

}
