package com.eol.cart.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

import static com.eol.common.JDBCTemplate.close;

import com.eol.cart.model.vo.Cart;

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
			//selectCart=SELECT * FROM CART M_NO=?
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Cart c = new Cart();
				c.setcNo(rs.getInt("c_no"));
				c.setmNo(rs.getInt("p_no"));
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
	
	
	
	
	
	

}
