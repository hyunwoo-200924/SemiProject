package com.eol.member.model.service;

import static com.eol.common.JDBCTemplate.getConnection;

import java.sql.Connection;

import com.eol.member.model.dao.PointDao;
import com.eol.member.model.vo.Point;

public class PointService {
	
	PointDao poDao = new PointDao(); 
	
	public Point myPoint(int mNo){
		Connection conn =getConnection();
		
		Point p = poDao.myPoint(conn,mNo);
		
		return p;
		
		
	}

}
