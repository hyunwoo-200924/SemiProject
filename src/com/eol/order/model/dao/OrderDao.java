package com.eol.order.model.dao;

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

import com.eol.order.model.vo.OrderDetail;
import com.eol.order.model.vo.Orders;
import com.eol.product.model.vo.Product;

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
			//nNOrderselect=SELECT * FROM ORDERS WHERE M_NO=null AND O_NO=? AND O_PW=?
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
	
	public List<Orders> selectorderList(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> orderslist = new ArrayList();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectorderList"));
			//selectorderList=SELECT * FROM ORDERS WHERE ORDERS.M_NO=?
			pstmt.setInt(1, mNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Orders o = new Orders();
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
				orderslist.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return orderslist;
	}
	
	public List<OrderDetail> selectodList(Connection conn, Orders order) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDetail> detaillist = new ArrayList();
		
		int oNo = order.getoNo();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectodList"));
			//selectodList=SELECT * FROM ORDERDETAIL WHERE O_NO=?
			pstmt.setInt(1, oNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDetail od = new OrderDetail();
				od.setOdNo(rs.getInt("od_no"));
				od.setoNo(rs.getInt("o_no"));
				od.setpNo(rs.getInt("p_no"));
				od.setOdQty(rs.getInt("od_qty"));
				detaillist.add(od);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return detaillist;
		
	}
	
	public Product selectodProduct(Connection conn,OrderDetail od) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product p = null;
		int pNo = od.getpNo();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectodProduct"));
			//selectodProduct=SELECT P_NO, P_NAME, P_PRICE, P_IMAGE1 FROM PRODUCT WHERE P_NO=?
			//받아온 od에 담긴 p_no와 같은 상품을 찾기
			pstmt.setInt(1, pNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				p = new Product();
				p.setpNo(rs.getInt("p_no"));
				p.setpName(rs.getString("p_name"));
				p.setpPrice(rs.getInt("p_price"));
				p.setpImage1(rs.getString("p_image1"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return p;
	}
	

	//주문리스트 가져오기
	public List<Orders> selectOrder(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> list = new ArrayList<Orders>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectOrder"));
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Orders o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setoRDate(rs.getDate("O_PAYDATE"));
				o.setoAmount(rs.getInt("O_AMOUNT"));
				o.setoPayment(rs.getInt("O_PAYMENT"));
				
				list.add(o);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	public List<Orders> selectorderCancelReturnList(Connection conn, int mNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> orderslist = new ArrayList();
		
		try {
			
			String cancelAsk = "취소신청";
			String cancelEnd = "취소완료";
			String returnAsk = "환불신청";
			String returnEnd = "환불완료";
			//"SELECT * FROM (SELECT * FROM ORDERS WHERE M_NO=?) WHERE O_STATUS=? OR O_STATUS=? OR O_DELIVERYSTATUS=? OR O_DELIVERYSTATUS=?";
			pstmt = conn.prepareStatement(prop.getProperty("selectCancelReturn"));
			pstmt.setInt(1, mNo);
			pstmt.setString(2, cancelAsk);
			pstmt.setString(3, cancelEnd);
			pstmt.setString(4, returnAsk);
			pstmt.setString(5, returnEnd);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Orders o = new Orders();
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
				orderslist.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return orderslist;
	}

	//각각 주문에 대한 주문디테일로 상품명 가져오기
	public String selectodList(Connection conn, int oNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String pName = null;
		System.out.println(oNo);
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectpName"));
			pstmt.setInt(1, oNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pName = rs.getString("P_NAME");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(pName);
		return pName;
	}

}
