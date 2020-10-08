package com.eol.product.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;

import com.eol.order.model.vo.OrderDetail;
import com.eol.product.model.dao.ProductDao;
import com.eol.product.model.vo.Product;


public class ProductService {
	
	private ProductDao dao=new ProductDao();

	public int insertProduct(Product p) {
		Connection conn=getConnection();
		int result=dao.insertProduct(conn,p);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	


}
