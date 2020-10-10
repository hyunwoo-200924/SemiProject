package com.eol.product.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.eol.order.model.vo.OrderDetail;
import com.eol.product.model.dao.ProductDao;
import com.eol.product.model.vo.Product;


public class ProductService {
	
	private ProductDao dao=new ProductDao();

	public List<Product> productList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Product> list=dao.productList(conn, cPage,numPerPage);
		close(conn);
		return list;
	}
	
	public int productCount() {
		Connection conn=getConnection();
		int count=dao.productCount(conn);
		close(conn);
		return count;
		
		
	}
	
	public int insertProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.insertProduct(conn,p);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	



	public Product selectOneProduct(int pNo) {
		Connection conn=getConnection();
		Product p=dao.selectOneProduct(conn,pNo);
		close(conn);
		return p;
	}

	public int updateProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.updateProduct(conn,p);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteProduct(int pNo) {
		Connection conn=getConnection();
		int result=dao.deleteProduct(conn, pNo);
		return result;
	}





}
