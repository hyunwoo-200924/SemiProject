package com.eol.cart.model.dao;

import static com.eol.common.JDBCTemplate.close;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Array;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import com.eol.cart.model.vo.Cart;
import com.eol.member.model.vo.Member;
import com.eol.product.model.vo.Product;

public class CartDao {
	
	Properties prop = new Properties();	
	
	public CartDao() {
		// TODO Auto-generated constructor stub
		try {
			String path=CartDao.class.getResource("/cart/cart.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	public List<Cart> selectCart(Connection conn,int mNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List list = new ArrayList();
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectCart"));
			//selectCart=SELECT * FROM WHERE CART M_NO=?
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart c = new Cart();
				c.setcNo(rs.getInt("c_no"));
				c.setmNo(rs.getInt("m_no"));
				c.setpNo(rs.getInt("p_no"));
				c.setcQty(rs.getInt("c_qty"));
				c.setoDeliveryEDate(rs.getString("o_deliveryedate"));
				c.setpName(rs.getString("P_NAME"));
				c.setpPrice(rs.getInt("P_PRICE"));
				c.setpImage1(rs.getString("P_IMAGE1"));
				list.add(c);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
	
	public Product selectCartProduct(Connection conn, int pNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product p = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectCartProduct"));
			//selectCartProduct=SELECT * FROM PRODUCT WHERE P_NO=?
			pstmt.setInt(1, pNo);
			rs = pstmt.executeQuery();
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

	public int insertCart(Connection conn, Cart c) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertCart"));
			pstmt.setInt(1, c.getmNo());
			pstmt.setInt(2, c.getpNo());
			pstmt.setInt(3, c.getcQty());
			pstmt.setString(4, c.getoDeliveryEDate());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public int updateCartNum(Connection conn , int mNo, int pNo, String oDeliveryEDate) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("updateCartNum"));
			pstmt.setString(1, oDeliveryEDate);
			pstmt.setInt(2, mNo);
			pstmt.setInt(3, pNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//장바구니 전체 삭제
	public int deleteCartAll(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteCartAll"));
			pstmt.setInt(1, mNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//장바구니 부분 삭제
	public int deleteCartYs(Connection conn, int mNo, int pNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deleteCartYs"));
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, pNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//회원이 결제하고 나서 장바구니 자동으로 비우는거
	public int deleteCart(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt=conn.prepareStatement(prop.getProperty("deleteCart"));
			//deleteCart=DELETE FROM CART WHERE M_NO=?;
			pstmt.setInt(1, mNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public List<Cart> oneCartIntoPay(Connection conn , int mNo, int cNo) {
		PreparedStatement pstmt = null;
		List list = new ArrayList();
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("oneCartIntoPay"));
			//selectCartProduct=SELECT * FROM PRODUCT WHERE P_NO=?
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, cNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				Cart c = new Cart();
				c.setcNo(rs.getInt("c_no"));
				c.setmNo(rs.getInt("m_no"));
				c.setpNo(rs.getInt("p_no"));
				c.setcQty(rs.getInt("c_qty"));
				c.setoDeliveryEDate(rs.getString("o_deliveryedate"));
				c.setpName(rs.getString("P_NAME"));
				c.setpPrice(rs.getInt("P_PRICE"));
				c.setpImage1(rs.getString("P_IMAGE1"));
				list.add(c);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return list;
	}
}
