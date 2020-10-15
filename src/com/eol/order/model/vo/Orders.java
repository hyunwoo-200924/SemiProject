package com.eol.order.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.eol.product.model.vo.Product;

public class Orders {
	
	private int oNo;//주문번호 1회 주문결제 할 때 부여되는 고유번호
	private int mNo;//회원이 주문할때 회원번호
	private String oName;//주문자 이름
	private String oPhone;//주문자 연락처
	private String oAddress;//받는사람 주소
	private Date oDeliveryDate;//배송시작날짜
	private int oAmount;//주문하는 상품의 종류 수
	private int oPayment;//결제한 금액(배송비까지 포함)
	private String oPw;//비회원 주문 비밀번호 - 회원은 null
	private String oStatus;//결제 상태 : 결제완료, 취소신청, 취소완료
	private Date oPayDate;//결제하기 완료 날짜
	private String oDeliveryStatus;//배송상태 : 배송준비중, 배송중, 배송완료, 환불신청, 환불완료
	private Date oDeliveryEDate;//배송완료날짜
	private String oPayWays;//결제수단
	private List<OrderDetail> details=new ArrayList();
	private String orderContent; //"사과 외 3건" 문구담으려고 만든 변수
	private String oToName;//받는사람 이름
	private String oToPhone;//받는사람 연락처
	private String pImage1;//상품이미지 하나 담으려고 만든 변수
	private List<Product> ps=new ArrayList();//상품정보 담으려고 만든 변수
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}



	public Orders(int oNo, int mNo, String oName, String oPhone, String oAddress, Date oDeliveryDate, int oAmount,
			int oPayment, String oPw, String oStatus, Date oPayDate, String oDeliveryStatus, Date oDeliveryEDate,
			String oPayWays, List<OrderDetail> details, String orderContent, String oToName, String oToPhone) {
		super();
		this.oNo = oNo;
		this.mNo = mNo;
		this.oName = oName;
		this.oPhone = oPhone;
		this.oAddress = oAddress;
		this.oDeliveryDate = oDeliveryDate;
		this.oAmount = oAmount;
		this.oPayment = oPayment;
		this.oPw = oPw;
		this.oStatus = oStatus;
		this.oPayDate = oPayDate;
		this.oDeliveryStatus = oDeliveryStatus;
		this.oDeliveryEDate = oDeliveryEDate;
		this.oPayWays = oPayWays;
		this.details = details;
		this.orderContent = orderContent;
		this.oToName = oToName;
		this.oToPhone = oToPhone;
	}











	public int getoNo() {
		return oNo;
	}


	public void setoNo(int oNo) {
		this.oNo = oNo;
	}


	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}


	public String getoName() {
		return oName;
	}


	public void setoName(String oName) {
		this.oName = oName;
	}


	public String getoPhone() {
		return oPhone;
	}


	public void setoPhone(String oPhone) {
		this.oPhone = oPhone;
	}


	public String getoAddress() {
		return oAddress;
	}


	public void setoAddress(String oAddress) {
		this.oAddress = oAddress;
	}


	public Date getoDeliveryDate() {
		return oDeliveryDate;
	}


	public void setoDeliveryDate(Date oDeliveryDate) {
		this.oDeliveryDate = oDeliveryDate;
	}


	public int getoAmount() {
		return oAmount;
	}


	public void setoAmount(int oAmount) {
		this.oAmount = oAmount;
	}


	public int getoPayment() {
		return oPayment;
	}


	public void setoPayment(int oPayment) {
		this.oPayment = oPayment;
	}


	public String getoPw() {
		return oPw;
	}


	public void setoPw(String oPw) {
		this.oPw = oPw;
	}


	public String getoStatus() {
		return oStatus;
	}


	public void setoStatus(String oStatus) {
		this.oStatus = oStatus;
	}


	public Date getoPayDate() {
		return oPayDate;
	}


	public void setoPayDate(Date oPayDate) {
		this.oPayDate = oPayDate;
	}


	public String getoDeliveryStatus() {
		return oDeliveryStatus;
	}


	public void setoDeliveryStatus(String oDeliveryStatus) {
		this.oDeliveryStatus = oDeliveryStatus;
	}


	public Date getoDeliveryEDate() {
		return oDeliveryEDate;
	}


	public void setoDeliveryEDate(Date oDeliveryEDate) {
		this.oDeliveryEDate = oDeliveryEDate;
	}


	public String getoPayWays() {
		return oPayWays;
	}


	public void setoPayWays(String oPayWays) {
		this.oPayWays = oPayWays;
	}


	public List<OrderDetail> getDetails() {
		return details;
	}


	public void setDetails(List<OrderDetail> details) {
		this.details = details;
	}


	public String getOrderContent() {
		return orderContent;
	}


	public void setOrderContent(String orderContent) {
		this.orderContent = orderContent;
	}





	public String getoToName() {
		return oToName;
	}





	public void setoToName(String oToName) {
		this.oToName = oToName;
	}



	public String getoToPhone() {
		return oToPhone;
	}



	public void setoToPhone(String oToPhone) {
		this.oToPhone = oToPhone;
	}



	public String getpImage1() {
		return pImage1;
	}



	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}



	public List<Product> getPs() {
		return ps;
	}



	public void setPs(List<Product> ps) {
		this.ps = ps;
	}



	@Override
	public String toString() {
		return "Orders [oNo=" + oNo + ", mNo=" + mNo + ", oName=" + oName + ", oPhone=" + oPhone + ", oAddress="
				+ oAddress + ", oDeliveryDate=" + oDeliveryDate + ", oAmount=" + oAmount + ", oPayment=" + oPayment
				+ ", oPw=" + oPw + ", oStatus=" + oStatus + ", oPayDate=" + oPayDate + ", oDeliveryStatus="
				+ oDeliveryStatus + ", oDeliveryEDate=" + oDeliveryEDate + ", oPayWays=" + oPayWays + ", details="
				+ details + ", orderContent=" + orderContent + ", oToName=" + oToName + ", oToPhone=" + oToPhone
				+ ", pImage1=" + pImage1 + ", ps=" + ps + "]";
	}
	
	

	

	
	
	


	

}