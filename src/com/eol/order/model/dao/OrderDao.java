package com.eol.order.model.dao;

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
import com.eol.order.model.vo.OrderDetail;
import com.eol.order.model.vo.Orders;
import com.eol.order.model.vo.WishList;
import com.eol.product.model.vo.Product;
import com.eol.qna.model.vo.Paging;

public class OrderDao {
	
	Properties prop = new Properties();
	
	public OrderDao() {
		try {
			String path = OrderDao.class.getResource("/orders/orders.properties").getPath();
			prop.load(new FileReader(path));
		}catch(IOException e) {
			e.printStackTrace();
		}
	}
	
	//비회원 주문조회
	public Orders nMOrderList(Connection conn, String nMONum, String pw) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Orders o = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("nNOrderselect"));
			//nNOrderselect=SELECT * FROM ORDERS WHERE M_NO=null AND O_NO=? AND O_PW=?
			pstmt.setString(1,nMONum);
			pstmt.setString(2, pw);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setmNo(rs.getInt("m_no"));
				o.setoName(rs.getString("o_name"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddress(rs.getString("o_address"));
				o.setoDeliveryDate(rs.getDate("o_deliverydate"));
				o.setoAmount(rs.getInt("o_amount"));
				o.setoPayment(rs.getInt("o_payment"));
				o.setoPw(rs.getString("o_pw"));
				o.setoStatus(rs.getString("o_status"));
				o.setoPayDate(rs.getDate("o_paydate"));
				o.setoDeliveryStatus(rs.getString("o_deliverystatus"));
				o.setoDeliveryEDate(rs.getString("o_deliveryedate"));
				o.setoPayWays(rs.getString("o_payways"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return o;
	}
	
	
	//회원이 그동안 주문한 내역 가져오기 (취소, 환불 빼고)
	public List<Orders> selectorderList(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> orderslist = new ArrayList();
		String st = "결제완료";
		String ods = "배송준비중";
		String ods1 = "배송중";
		String ods2 = "배송완료";
		String ods3 = "구매확정";
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectorderList"));
			//selectorderList=SELECT * FROM (SELECT * FROM ORDERS WHERE M_NO=? AND O_STATUS=?) WHERE O_DELIVERYSTATUS=? or O_DELIVERYSTATUS=? or o_deliverystatus=? or o_deliverystatus=?
			pstmt.setInt(1, mNo);
			pstmt.setString(2, st);
			pstmt.setString(3, ods);
			pstmt.setString(4, ods1);
			pstmt.setString(5, ods2);
			pstmt.setString(6, ods3);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Orders o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setmNo(rs.getInt("m_no"));
				o.setoName(rs.getString("o_name"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddress(rs.getString("o_address"));
				o.setoDeliveryDate(rs.getDate("o_deliverydate"));
				o.setoAmount(rs.getInt("o_amount"));
				o.setoPayment(rs.getInt("o_payment"));
				o.setoPw(rs.getString("o_pw"));
				o.setoStatus(rs.getString("o_status"));
				o.setoPayDate(rs.getDate("o_paydate"));
				o.setoDeliveryStatus(rs.getString("o_deliverystatus"));
				o.setoDeliveryEDate(rs.getString("o_deliveryedate"));
				o.setoPayWays(rs.getString("o_payways"));
				System.out.println(o);
				orderslist.add(o);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return orderslist;
	}
	
	public List<OrderDetail> selectodList(Connection conn, Orders order) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<OrderDetail> detaillist = new ArrayList();
		
		int oNo = order.getoNo();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectodList"));
			//selectodList=SELECT * FROM ORDERDETAIL WHERE O_NO=?
			pstmt.setInt(1, oNo);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				OrderDetail od = new OrderDetail();
				od.setOdNo(rs.getInt("od_no"));
				od.setoNo(rs.getInt("o_no"));
				od.setpNo(rs.getInt("p_no"));
				od.setOdQty(rs.getInt("od_qty"));
				detaillist.add(od);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return detaillist;
		
	}
	
	public Product selectodProduct(Connection conn,OrderDetail od) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Product p = null;
		int pNo = od.getpNo();
		try {
			pstmt=conn.prepareStatement(prop.getProperty("selectodProduct"));
			//selectodProduct=SELECT P_NO, P_NAME, P_PRICE, P_IMAGE1 FROM PRODUCT WHERE P_NO=?
			//받아온 od에 담긴 p_no와 같은 상품을 찾기
			pstmt.setInt(1, pNo);
			rs=pstmt.executeQuery();
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
	

	//주문리스트 가져오기
	public List<Orders> selectOrder(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> list = new ArrayList<Orders>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectOrder"));
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				Orders o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setoPayDate(rs.getDate("o_paydate"));
				o.setoAmount(rs.getInt("O_AMOUNT"));
				o.setoPayment(rs.getInt("O_PAYMENT"));
				o.setoStatus(rs.getString("o_status"));
				
				list.add(o);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	
	//취소/환불 조회
	public List<Orders> selectorderCancelReturnList(Connection conn, int mNo){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<Orders> orderslist = new ArrayList();
		
		try {
			
			String cancelAsk = "취소신청";
			String cancelEnd = "취소완료";
			String returnAsk = "환불신청";
			String returnEnd = "환불완료";
			//"SELECT * FROM (SELECT * FROM ORDERS WHERE M_NO=?) WHERE O_STATUS=? OR O_STATUS=? OR O_DELIVERYSTATUS=? OR O_DELIVERYSTATUS=?";
			pstmt = conn.prepareStatement(prop.getProperty("selectCancelReturn"));
			pstmt.setInt(1, mNo);
			pstmt.setString(2, cancelAsk);
			pstmt.setString(3, cancelEnd);
			pstmt.setString(4, returnAsk);
			pstmt.setString(5, returnEnd);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				Orders o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setmNo(rs.getInt("m_no"));
				o.setoName(rs.getString("o_name"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddress(rs.getString("o_address"));
				o.setoDeliveryDate(rs.getDate("o_deliverydate"));
				o.setoAmount(rs.getInt("o_amount"));
				o.setoPayment(rs.getInt("o_payment"));
				o.setoPw(rs.getString("o_pw"));
				o.setoStatus(rs.getString("o_status"));
				o.setoPayDate(rs.getDate("o_paydate"));
				o.setoDeliveryStatus(rs.getString("o_deliverystatus"));
				o.setoDeliveryEDate(rs.getString("o_deliveryedate"));
				o.setoPayWays(rs.getString("o_payways"));
				orderslist.add(o);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return orderslist;
	}

	//각각 주문에 대한 주문디테일로 상품명 가져오기, 상품 사진 추가
	public String[] selectodList(Connection conn, int oNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String[] pNamepImage = new String[2];
		System.out.println(oNo);
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectpName"));
			pstmt.setInt(1, oNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				pNamepImage[0] = rs.getString("P_NAME");
				pNamepImage[1] = rs.getString("P_IMAGE1");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(pNamepImage);
		return pNamepImage;
	}
	
	
	//결제완료 후 주문내역 DB orders테이블에 담기
	public int orderinsert(Connection conn, Member m, Orders o) {
		PreparedStatement pstmt = null;
		int result = 0;
		String ods = "배송준비중";
		try {
			if(m!=null) {//회원일 때 첫번쨰 ?에 회원번호 컬럼				
				pstmt = conn.prepareStatement(prop.getProperty("insertOrder"));
				//insertOrder=INSERT INTO ORDERS VALUES(ORD_SEQ.NEXTVAL,?,NULL,?,?,?,TO_CHAR(TO_DATE(?,'YYYY-MM-DD')-2, YYYY-MM-DD),?,?,?,SYSDATE,?,?,?,?,?)
				pstmt.setInt(1, o.getmNo());
			}else {//비회원일 때 첫번째 ?가 주문비밀번호 컬럼
				pstmt = conn.prepareStatement(prop.getProperty("noMemberinsertOrder"));
				//noMemberinsertOrder=INSERT INTO ORDERS VALUES(ORD_SEQ.NEXTVAL, NULL,?,?,?,?,(TO_DATE(?, 'YYYY-MM-DD'), 'YYYY-MM-DD'),?,?,?,SYSDATE,?,?,?,?,?)
				pstmt.setString(1, o.getoPw());
			}
			pstmt.setString(2,o.getoName());
			pstmt.setString(3, o.getoPhone());
			pstmt.setString(4, o.getoAddress());
			pstmt.setString(5, o.getoDeliveryEDate());
			pstmt.setInt(6, o.getoAmount());
			pstmt.setInt(7, o.getoPayment());
			pstmt.setString(8, o.getoStatus());
			pstmt.setString(9, ods);
			pstmt.setString(10, o.getoDeliveryEDate());
			pstmt.setString(11, o.getoPayWays());
			pstmt.setString(12, o.getoToName());
			pstmt.setString(13,o.getoToPhone());
			
			result = pstmt.executeUpdate();
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//결제완료 후 주문내역의 상세내역 DB orderDetail테이블에 담기
	public int odinsert(Connection conn, Cart c, int oNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("odinsert"));
			//odinsert=INSERT INTO ORDERDETAIL VALUES(ORDD_SEQ.NEXTVAL,?,?,?)
			pstmt.setInt(1, oNo);
			pstmt.setInt(2, c.getpNo());
			pstmt.setInt(3, c.getcQty());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	//회원이 지금 막 주문해서 부여받은 주문번호 가져오기
	public int selectoNo(Connection conn,int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int oNo = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectoNo"));
			//selectoNo=SELECT MAX(O_NO) FROM ORDERS WHERE M_NO=?
			pstmt.setInt(1, mNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				oNo = rs.getInt(1);
			}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return oNo;
	}
	
	//비회원이 지금 막 주문해서 부여받은 주문번호 가져오기
	public int noMemberselectoNo(Connection conn, String oPw, String oName, String oPhone) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int oNo = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("nonMemberselectoNo"));
			//nonMemberselectoNo=SELECT MAX(O_NO) FROM ORDERS WHERE O_PW=? AND O_NAME=? AND O_PHONE=?
			pstmt.setString(1, oPw);
			pstmt.setString(2, oName);
			pstmt.setString(3, oPhone);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				oNo = rs.getInt(1);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return oNo;
	}
	
	//비회원이 결제완료 후 주문 생세내역 DB에 담기
	public int nonodinsert(Connection conn, Product p, int oNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("odinsert"));
			//odinsert=INSERT INTO ORDERDETAIL VALUES(ORDD_SEQ.NEXTVAL,?,?,?)
			pstmt.setInt(1, oNo);
			pstmt.setInt(2, p.getpNo());
			pstmt.setInt(3, p.getpCount());
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	
	//비회원이 취소신청 하는거 !!!!!
	public int updateoStatus(Connection conn, int oNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String status = "취소신청";
		try{
			pstmt = conn.prepareStatement(prop.getProperty("updateoStatus"));
			//updateoStatus=UPDATE ORDERS SET O_STATUS=? WHERE O_NO=?
			pstmt.setString(1, status);
			pstmt.setInt(2, oNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}
	
	public Orders selectorder(Connection conn, int oNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Orders o = null;
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectorder"));
			//selectorder=SELECT * FROM ORDERS WHERE O_NO=?
			pstmt.setInt(1, oNo);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				o = new Orders();
				o.setoNo(rs.getInt("o_no"));
				o.setmNo(rs.getInt("m_no"));
				o.setoName(rs.getString("o_name"));
				o.setoPhone(rs.getString("o_phone"));
				o.setoAddress(rs.getString("o_address"));
				o.setoDeliveryDate(rs.getDate("o_deliverydate"));
				o.setoAmount(rs.getInt("o_amount"));
				o.setoPayment(rs.getInt("o_payment"));
				o.setoPw(rs.getString("o_pw"));
				o.setoStatus(rs.getString("o_status"));
				o.setoPayDate(rs.getDate("o_paydate"));
				o.setoDeliveryStatus(rs.getString("o_deliverystatus"));
				o.setoDeliveryEDate(rs.getString("o_deliveryedate"));
				o.setoPayWays(rs.getString("o_payways"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(rs);
			close(pstmt);
		}return o;
	}
	
	public int updateoDeliveryStatus(Connection conn,int oNo,String st) {
		PreparedStatement pstmt = null;
		int result = 0;
		try{
			pstmt = conn.prepareStatement(prop.getProperty("updateoDeliveryStatus"));
			//updateoDeliveryStatus=UPDATE ORDERS SET O_DELIVERYSTATUS=? WHERE O_NO=?
			pstmt.setString(1, st);
			pstmt.setInt(2, oNo);
			result = pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			close(pstmt);
		}return result;
	}

	//찜한 내역 가져오기 페이징 처리
	public List<WishList> selectJjim(Connection conn, Paging pg, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WishList> list = new ArrayList<WishList>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectJjimPg"));
			
			int startRow = (pg.getCurrentPage() - 1) * pg.getNumPerPage() + 1;
			int endRow = pg.getCurrentPage() * pg.getNumPerPage();
			
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WishList w = new WishList();
				
				w.setwNo(rs.getInt("W_NO"));
				w.setmNo(rs.getInt("M_NO"));
				w.setpNo(rs.getInt("P_NO"));
				w.setpName(rs.getString("p_name"));
				w.setpPrice(rs.getInt("p_price"));
				w.setpImage1(rs.getString("P_IMAGE1"));
				w.setpServing(rs.getInt("P_SERVING"));
				w.setpCookTime(rs.getInt("P_COOKTIME"));
				
				list.add(w);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}
	//찜한 내역 가져오기 페이징 ㄴㄴ
	public List<WishList> selectJjim(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<WishList> list = new ArrayList<WishList>();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("selectJjim"));
			
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				WishList w = new WishList();
				
				w.setwNo(rs.getInt("W_NO"));
				w.setmNo(rs.getInt("M_NO"));
				w.setpNo(rs.getInt("P_NO"));
				w.setpName(rs.getString("p_name"));
				w.setpPrice(rs.getInt("p_price"));
				w.setpImage1(rs.getString("P_IMAGE1"));
				w.setpServing(rs.getInt("P_SERVING"));
				w.setpCookTime(rs.getInt("P_COOKTIME"));
				
				list.add(w);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return list;
	}

	public Orders orderdetail(Connection conn, int oNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Orders o = new Orders();
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("orderdetail"));
			pstmt.setInt(1, oNo);
			
			rs = pstmt.executeQuery();
			
			List<Product> ps = new ArrayList<Product>();
			
			while(rs.next()) {
				//상품정보
				Product p = new Product();
				p.setpImage1(rs.getString("P_IMAGE1"));
				p.setpName(rs.getString("P_NAME"));
				p.setpPrice(rs.getInt("P_PRICE"));
				p.setpCount(rs.getInt("od_qty"));
				p.setpNo(rs.getInt("p_no"));
				ps.add(p);
				
				o.setoNo(rs.getInt("o_no"));
				o.setoStatus(rs.getString("o_status"));
				o.setPs(ps);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		
		return o;
	}

	//찜하기
	public int insertWishList(Connection conn, int pNo, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("insertWishList"));
			pstmt.setInt(1, mNo);
			pstmt.setInt(2, pNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	//찜 삭제하기
	public int deletetWishList(Connection conn, int pNo, int mNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("deletetWishList"));
			pstmt.setInt(1, pNo);
			pstmt.setInt(2, mNo);
			
			result = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;

	}

	//위시리스트 갯수
	public int getListCount(Connection conn, int mNo) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int result = 0;
		
		try {
			pstmt = conn.prepareStatement(prop.getProperty("getListCount"));
			pstmt.setInt(1, mNo);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return result;
	}
}
