package com.eol.order.model.service;

import static com.eol.common.JDBCTemplate.close;
import static com.eol.common.JDBCTemplate.commit;
import static com.eol.common.JDBCTemplate.getConnection;
import static com.eol.common.JDBCTemplate.rollback;

import java.sql.Connection;
import java.util.List;

import com.eol.cart.model.vo.Cart;
import com.eol.member.model.vo.Member;
import com.eol.order.model.dao.OrderDao;
import com.eol.order.model.vo.OrderDetail;
import com.eol.order.model.vo.Orders;
import com.eol.product.model.vo.Product;

public class OrderService {
	
	OrderDao dao=new OrderDao();
	
	//비회원 주문조회
	public Orders nMOrderList(String nMONum, String pw) {
		
		//비회원 주문조회 : 클라이언트에게 입력받은 주문번호와 주문비밀번호를 가져와서 dao에게 전달
		Connection conn = getConnection();
		Orders o = dao.nMOrderList(conn, nMONum, pw);
		close(conn);
		return o;
	}

	public List<Orders> selectOrder(int mNo) {
		Connection conn = getConnection();
		
		List<Orders> list = dao.selectOrder(conn, mNo);
		
		close(conn);
		
		return list;
	}
	
	
	//회원 주문조회
	public List<Orders> orderList(int mNo) {
		//회원 주문조회 : 이미 로그인 되어있는 회원의 번호를 가져옴
		Connection conn = getConnection();
		List<Orders> list = dao.selectorderList(conn, mNo);
		close(conn);
		return list;
	}
	
	public List<OrderDetail> orderdetailList(Orders order) {
		Connection conn = getConnection();
		List<OrderDetail> odlist = dao.selectodList(conn, order);
		close(conn);
		return odlist;
	}
	
	public Product odproduct(OrderDetail od) {
		Connection conn = getConnection();
		Product p = dao.selectodProduct(conn, od);
		close(conn);
		return p;
	}
	
	
	
	
	
	//취소/반품조회
	public List<Orders> orderCancelReturnList(int mNo){
		Connection conn = getConnection();
		List<Orders> list = dao.selectorderCancelReturnList(conn, mNo);
		close(conn);
		return list;
	}

	//각각 주문에 대한 주문디테일로 상품명 가져오기
	public String orderdetailList(int oNo) {
		Connection conn = getConnection();
		
		String pName = dao.selectodList(conn, oNo);
		
		close(conn);
		
		return pName;
	}
	
	
	//결제 완료 후 주문내역 DB에 담기
	public int orderinsert(Member m, Orders o) {
		Connection conn = getConnection();
		int result = dao.orderinsert(conn, m, o);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//회원이 결제완료 후 주문내역의 상세내역 DB에 담기
	public int odinsert(Cart c, int oNo) {
		Connection conn = getConnection();
		int result = dao.odinsert(conn, c, oNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	//회원이 갓 주문해서 주문정보를 인서트 할 때 부여받은 주문번호 가져오기
	public int selectoNo(int mNo) {
		Connection conn = getConnection();
		int oNo = dao.selectoNo(conn, mNo);
		close(conn);
		return oNo;
	}
	
	
	//비회원이 갓 주문해서 주문정보를 인서트 할 떄 부여받은 주문번호 가져오기
	public int noMemberselectoNo(String oPw, String oName, String oPhone) {
		Connection conn = getConnection();
		int oNo = dao.noMemberselectoNo(conn, oPw, oName, oPhone);
		close(conn);
		return oNo;
		}
	
	
	//비회원이 결제완료 후  주문내역의 상세내역 DB에 담기
	public int noMemberodinsert(Product p, int oNo) {
		Connection conn = getConnection();
		int result = dao.nonodinsert(conn, p, oNo);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
	
	
	
	

}
