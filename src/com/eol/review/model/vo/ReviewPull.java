package com.eol.review.model.vo;

import java.util.Date;

public class ReviewPull {
	private int rNo;
	private int oNo;
	private int mNo;
	private int pNo;
	private int odNo;
	private String pName;
	private Date oPayDate;
	
	public ReviewPull() {
		// TODO Auto-generated constructor stub
	}

	public ReviewPull(int rNo, int oNo, int mNo, int pNo, int odNo, String pName, Date oPayDate) {
		super();
		this.rNo = rNo;
		this.oNo = oNo;
		this.mNo = mNo;
		this.pNo = pNo;
		this.odNo = odNo;
		this.pName = pName;
		this.oPayDate = oPayDate;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
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

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getOdNo() {
		return odNo;
	}

	public void setOdNo(int odNo) {
		this.odNo = odNo;
	}

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public Date getoPayDate() {
		return oPayDate;
	}

	public void setoPayDate(Date oPayDate) {
		this.oPayDate = oPayDate;
	}
	
}
