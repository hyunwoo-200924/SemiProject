package com.eol.order.model.vo;

import com.eol.product.model.vo.Product;

public class OrderDetail {
	
	private int odNo;
	private int oNo;
	private int pNo;
	private int odQty;
	private Product odproduct;
	
	public OrderDetail() {
		// TODO Auto-generated constructor stub
	}

	public OrderDetail(int odNo, int oNo, int pNo, int odQty, Product odproduct) {
		super();
		this.odNo = odNo;
		this.oNo = oNo;
		this.pNo = pNo;
		this.odQty = odQty;
		this.odproduct = odproduct;
	}

	public int getOdNo() {
		return odNo;
	}

	public void setOdNo(int odNo) {
		this.odNo = odNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getOdQty() {
		return odQty;
	}

	public void setOdQty(int odQty) {
		this.odQty = odQty;
	}

	public Product getOdproduct() {
		return odproduct;
	}

	public void setOdproduct(Product odproduct) {
		this.odproduct = odproduct;
	}

	
	

}
