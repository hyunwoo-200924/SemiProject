package com.eol.order.model.service;

import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.eol.order.model.dao.OrderDao;
import com.eol.order.model.vo.Orders;

public class OrderService {
	
	OrderDao dao=new OrderDao();
	
	public Orders nMOrderList(String nMONum, String pw) {
		
		//
		Connection conn = getConnection();
		Orders o = dao.nMOrderList(conn, nMONum, pw);
		close(conn);
		return o;
	}

	public List<Orders> selectOrder(int mNo) {
		Connection conn = getConnection();
		
		List<Orders> list = dao.selectOrder(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	

}
