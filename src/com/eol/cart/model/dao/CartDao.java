package com.eol.cart.model.dao;

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
	
}
