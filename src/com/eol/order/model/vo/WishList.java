package com.eol.order.model.vo;

public class WishList {

	private int wNo;
	private int mNo;
	private int pNo;
	private String pName;
	private int pPrice;
	private String pImage1;
	
	public WishList() {
		// TODO Auto-generated constructor stub
	}

	public WishList(int wNo, int mNo, int pNo) {
		super();
		this.wNo = wNo;
		this.mNo = mNo;
		this.pNo = pNo;
	}

	public int getwNo() {
		return wNo;
	}

	public void setwNo(int wNo) {
		this.wNo = wNo;
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
	
	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getpPrice() {
		return pPrice;
	}

	public void setpPrice(int pPrice) {
		this.pPrice = pPrice;
	}

	public String getpImage1() {
		return pImage1;
	}

	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}

	@Override
	public String toString() {
		return "WishList [wNo=" + wNo + ", mNo=" + mNo + ", pNo=" + pNo + "]";
	}
	
	
}
