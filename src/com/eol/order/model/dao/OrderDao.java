package com.eol.order.model.dao;

import java.io.FileReader;
import static com.eol.common.JDBCTemplate.close;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.eol.order.model.vo.Orders;

public class OrderDao {
	
	Properties prop = new Properties();
	
	public OrderDao() {
		try {
			String path = OrderDao.class.getResource("/orders/orders.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public Orders nMOrderList(Connection conn, String nMONum, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Orders o = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("nNOrderselect"));
			//nNOrderselect=SELECT * FROM ORDERS WHERE M_NO=999 AND O_NO=? AND O_PW=?
			pstmt.setString(1,nMONum);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setmNo(rs.getInt("m_no"));
				o.setoRDate(rs.getDate("o_rdate"));
				o.setoName(rs.getString("o_name"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddress(rs.getString("o_address"));
				o.setoDeliveryDate(rs.getDate("o_deliverydate"));
				o.setoAmount(rs.getInt("o_amount"));
				o.setoPayment(rs.getInt("o_payment"));
				o.setoPw(rs.getString("o_pw"));
				o.setoStatus(rs.getString("o_status"));
				o.setoPayDate(rs.getDate("o_paydate"));
				o.setoAllowDate(rs.getDate("o_allowdate"));
				o.setoDeliveryStatus(rs.getString("o_deliverystatus"));
				o.setoDeliveryEDate(rs.getDate("o_deliveryedate"));
				o.setoPayWays(rs.getString("o_payways"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return o;
	}

}
