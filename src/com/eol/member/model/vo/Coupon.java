package com.eol.member.model.vo;

public class Coupon {
	
	private int mNo;
	private int coType;
	private int coContent;
	
	public Coupon(int mNo, int coType, int coContent) {
		super();
		this.mNo = mNo;
		this.coType = coType;
		this.coContent = coContent;
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
	
	

}
