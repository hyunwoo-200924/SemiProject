package com.eol.order.model.vo;

import java.util.Date;

public class Orders {
	
	private int oNo;
	private int mNo;
	private Date oRdate;
	private String oName;
	private String oPhone;
	private String oAddress;
	private Date oDeliveryDate;
	private int oAmount;
	private int oPayment;
	private String oPw;
	
	public Orders() {
		// TODO Auto-generated constructor stub
	}

	public Orders(int oNo, int mNo, Date oRdate, String oName, String oPhone, String oAddress, Date oDeliveryDate,
			int oAmount, int oPayment, String oPw) {
		super();
		this.oNo = oNo;
		this.mNo = mNo;
		this.oRdate = oRdate;
		this.oName = oName;
		this.oPhone = oPhone;
		this.oAddress = oAddress;
		this.oDeliveryDate = oDeliveryDate;
		this.oAmount = oAmount;
		this.oPayment = oPayment;
		this.oPw = oPw;
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

	public Date getoRdate() {
		return oRdate;
	}

	public void setoRdate(Date oRdate) {
		this.oRdate = oRdate;
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

	

	


}