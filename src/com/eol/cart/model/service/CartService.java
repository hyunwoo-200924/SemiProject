package com.eol.cart.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

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
	
	
	public Product cartProduct(int pNo) {
		Connection conn = getConnection();
		Product p = dao.selectCartProduct(conn, pNo);
		close(conn);
		return p;
	}
	
	public int insertCart(Cart c) {
		Connection conn =getConnection();
		int result = dao.insertCart(conn, c);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	public int updateCartNum(int mNo, int pNo, String oDeliveryEDate) {
		Connection conn = getConnection();
		int result = dao.updateCartNum(conn , mNo, pNo, oDeliveryEDate);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;

	}
	
	//결제 후 결제한 상품 회원의 장바구니 비우기
	public int deleteCart(int mNo) {
		Connection conn = getConnection();
		int result = dao.deleteCart(conn, mNo);
		if(result > 0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
