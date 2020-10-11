package com.eol.cart.model.service;

import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.close;

import java.sql.Connection;
import java.util.List;

import com.eol.cart.model.dao.CartDao;
import com.eol.cart.model.vo.Cart;
import com.eol.product.model.vo.Product;

public class CartService {
	
	CartDao dao = new CartDao();
	
	public List<Cart> cartintopay(int mNo){
		Connection conn = getConnection();
		List<Cart> list = dao.selectCart(conn, mNo);
		close(conn);
		return list;
	}
	
	
	
	
	
	
	
	
	
	
	
	public List<Cart> nonlistCart(){
		Connection conn =getConnection();
		List<Cart> list = dao.nonlistCart(conn);
		close(conn);
		return list;
	}
	
	public Product nonCartProduct(int pNo) {
		Connection conn = getConnection();
		Product p = dao.selectnonCartProduct(conn,pNo);
		close(conn);
		return p;
	}

}
