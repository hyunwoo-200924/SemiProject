package com.eol.cart.model.vo;

public class Cart {
	
	private int cNo;
	private int mNo;
	private int pNo;
	private int cQty;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cNo, int mNo, int pNo, int cQty) {
		super();
		this.cNo = cNo;
		this.mNo = mNo;
		this.pNo = pNo;
		this.cQty = cQty;
	}

	public int getcNo() {
		return cNo;
	}

	public void setcNo(int cNo) {
		this.cNo = cNo;
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

	public int getcQty() {
		return cQty;
	}

	public void setcQty(int cQty) {
		this.cQty = cQty;
	}
	

}
