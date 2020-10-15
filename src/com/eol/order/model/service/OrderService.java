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
import com.eol.order.model.vo.WishList;
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

	//주문내역 가져오기
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

	//각각 주문에 대한 주문디테일로 상품명 가져오기, 상품사진 추가
	public String[] orderdetailList(int oNo) {
		Connection conn = getConnection();
		
		String[] pNamepImage = dao.selectodList(conn, oNo);
		
		close(conn);
		
		return pNamepImage;
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

	//찜한 목록 가져오기
	public List<WishList> selectJjim(int mNo) {
		Connection conn = getConnection();
		
		List<WishList> list = dao.selectJjim(conn, mNo);
		
		close(conn);
		
		return list;
	}

	//주문 상세내역 가져오기
	public Orders orderdetail(int oNo) {
		Connection conn = getConnection();
		
		Orders o = dao.orderdetail(conn, oNo);
		
		close(conn);
		
		return o;
	}

	//찜하기
	public int insertWishList(int pNo, int mNo) {
		Connection conn = getConnection();
		
		int result = dao.insertWishList(conn, pNo, mNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}

	//찜 삭제하기
	public int deletetWishList(int pNo, int mNo) {
		Connection conn = getConnection();
		
		int result = dao.deletetWishList(conn, pNo, mNo);
		
		if(result > 0) commit(conn);
		else rollback(conn);
		
		close(conn);
		
		return result;
	}
	
	//비회원이 주문한 상품 취소신청버튼 누를 시 oStatus를 취소신청으로 변경하기
	public int changeoStatus(int oNo) {
		Connection conn = getConnection();
		int result = dao.updateoStatus(conn, oNo);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}
	
	//비회원 상태 취소신청으로 변경한거 다시 불러오기
	public Orders orderSelect(int oNo) {
		Connection conn = getConnection();
		Orders o = dao.selectorder(conn, oNo);
		close(conn);
		return o;
	}
	
	//비회원이 환불신청 버튼 누를시 oDeliveryStatus를 환불신청으로 변경하기
	public int changeoDeliveryStatus(int oNo, String st) {
		Connection conn = getConnection();
		int result = dao.updateoDeliveryStatus(conn, oNo, st);
		if(result>0) commit(conn);
		else rollback(conn);
		return result;
	}

}
