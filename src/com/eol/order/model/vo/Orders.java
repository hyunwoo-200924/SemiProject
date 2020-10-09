package com.eol.order.model.vo;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Orders {
	
	private int oNo;
	private int mNo;
	private Date oRDate;
	private String oName;
	private String oPhone;
	private String oAddress;
	private Date oDeliveryDate;
	private int oAmount;
	private int oPayment;
	private String oPw;
	private String oStatus;
	private Date oPayDate;
	private Date oAllowDate;
	private String oDeliveryStatus;
	private Date oDeliveryEDate;
	private String oPayWays;
	private List<OrderDetail> details=new ArrayList();
	private String orderContent; //"사과 외 3건" 문구담으려고 만든 변수
	
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}


	


	public Orders(int oNo, int mNo, Date oRDate, String oName, String oPhone, String oAddress, Date oDeliveryDate,
			int oAmount, int oPayment, String oPw, String oStatus, Date oPayDate, Date oAllowDate,
			String oDeliveryStatus, Date oDeliveryEDate, String oPayWays, List<OrderDetail> details) {
		super();
		this.oNo = oNo;
		this.mNo = mNo;
		this.oRDate = oRDate;
		this.oName = oName;
		this.oPhone = oPhone;
		this.oAddress = oAddress;
		this.oDeliveryDate = oDeliveryDate;
		this.oAmount = oAmount;
		this.oPayment = oPayment;
		this.oPw = oPw;
		this.oStatus = oStatus;
		this.oPayDate = oPayDate;
		this.oAllowDate = oAllowDate;
		this.oDeliveryStatus = oDeliveryStatus;
		this.oDeliveryEDate = oDeliveryEDate;
		this.oPayWays = oPayWays;
		this.details = details;
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





	public Date getoRDate() {
		return oRDate;
	}





	public void setoRDate(Date oRDate) {
		this.oRDate = oRDate;
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





	public Date getoAllowDate() {
		return oAllowDate;
	}





	public void setoAllowDate(Date oAllowDate) {
		this.oAllowDate = oAllowDate;
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

	


	

}