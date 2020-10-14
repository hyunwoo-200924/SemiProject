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
		System.out.println("list 갓다옴");
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
		System.out.println("번호잇는지 확인하고옴");
		return p;
	}

	public int updateProduct(Product p) {
		Connection conn=getConnection();
		System.out.println("수정하러감");
		int result=dao.updateProduct(conn,p);
		if(result>0) commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}

	public int deleteProduct(int pNo) {
		Connection conn=getConnection();
		int result=dao.deleteProduct(conn, pNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		System.out.println("서비스지나옴");
		return result;
	}

	//메인페이지 광고화면에 보여줄 상품정보 list받아오기
	public List<Product> slidePlist(){
		Connection conn = getConnection();
		List<Product> list = dao.slidePlist(conn);
		close(conn);
		return list;
	}
	
	
	//메인페이지에 실시간 베스트 보여줄 상품정보 list받아오기
	public List<Product> bestPlist(){
		Connection conn = getConnection();
		List<Product> list = dao.bestPlist(conn);
		close(conn);
		return list;
	}
	
	//메인페이지에 핫딜에 보여줄 상품정보 리스트받아오기 : 할인율이 가장 높은 순으로 상품 정렬

	public List<Product> hotdealPlist(){
		Connection conn = getConnection();
		List<Product> list = dao.hotdealPlist(conn);
		close(conn);
		return list;
	}

	//////////////현우 추가
	public List<Product> newMenuList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Product> list=dao.newMenuList(conn, cPage,numPerPage);
		close(conn);
		System.out.println("list 갓다옴");
		return list;
	}
	public List<Product> hotMenuList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Product> list=dao.hotMenuList(conn, cPage,numPerPage);
		close(conn);
		System.out.println("list 갓다옴");
		return list;
	}
	public List<Product> lowPriceMenuList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Product> list=dao.lowPriceMenuList(conn, cPage,numPerPage);
		close(conn);
		System.out.println("list 갓다옴");
		return list;
	}
	public List<Product> highPriceMenuList(int cPage, int numPerPage) {
		Connection conn=getConnection();
		List<Product> list=dao.highPriceMenuList(conn, cPage,numPerPage);
		close(conn);
		System.out.println("list 갓다옴");
		return list;
	}

}
