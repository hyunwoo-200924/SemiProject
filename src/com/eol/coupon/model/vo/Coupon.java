package com.eol.coupon.model.vo;

import java.sql.Date;

public class Coupon {
	
	private int mNo;
	private int coType;
	private int coContent;
	private String coName;
	private String coStatus;
	private Date coRDate;
	
	public Coupon() {
		// TODO Auto-generated constructor stub
	}

	public Coupon(int mNo, int coType, int coContent, String coName, String coStatus, Date coRDate) {
		super();
		this.mNo = mNo;
		this.coType = coType;
		this.coContent = coContent;
		this.coName = coName;
		this.coStatus = coStatus;
		this.coRDate = coRDate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public int getCoType() {
		return coType;
	}

	public void setCoType(int coType) {
		this.coType = coType;
	}

	public int getCoContent() {
		return coContent;
	}

	public void setCoContent(int coContent) {
		this.coContent = coContent;
	}

	public String getCoName() {
		return coName;
	}

	public void setCoName(String coName) {
		this.coName = coName;
	}

	public String getCoStatus() {
		return coStatus;
	}

	public void setCoStatus(String coStatus) {
		this.coStatus = coStatus;
	}

	public Date getCoRDate() {
		return coRDate;
	}

	public void setCoRDate(Date coRDate) {
		this.coRDate = coRDate;
	}

	@Override
	public String toString() {
		return "Coupon [mNo=" + mNo + ", coType=" + coType + ", coContent=" + coContent + ", coName=" + coName
				+ ", coStatus=" + coStatus + ", coRDate=" + coRDate + "]";
	}
	
}
