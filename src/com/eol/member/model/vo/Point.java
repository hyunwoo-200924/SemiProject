package com.eol.member.model.vo;

public class Point {
	
	private int mNO;
	private int pGet;
	private int pUse;
	private int pTotal;
	private String pStatus;

	public Point() {
		// TODO Auto-generated constructor stub
	}

	public int getmNO() {
		return mNO;
	}

	public void setmNO(int mNO) {
		this.mNO = mNO;
	}

	public int getpGet() {
		return pGet;
	}

	public void setpGet(int pGet) {
		this.pGet = pGet;
	}

	public int getpUse() {
		return pUse;
	}

	public void setpUse(int pUse) {
		this.pUse = pUse;
	}

	public int getpTotal() {
		return pTotal;
	}

	public void setpTotal(int pTotal) {
		this.pTotal = pTotal;
	}

	public String getpStatus() {
		return pStatus;
	}

	public void setpStatus(String pStatus) {
		this.pStatus = pStatus;
	}

	public Point(int mNO, int pGet, int pUse, int pTotal, String pStatus) {
		super();
		this.mNO = mNO;
		this.pGet = pGet;
		this.pUse = pUse;
		this.pTotal = pTotal;
		this.pStatus = pStatus;
	}

	@Override
	public String toString() {
		return "Point [mNO=" + mNO + ", pGet=" + pGet + ", pUse=" + pUse + ", pTotal=" + pTotal + ", pStatus=" + pStatus
				+ "]";
	}
	
	
}