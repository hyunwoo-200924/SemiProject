package com.eol.cart.model.vo;

import java.util.Date;

import com.eol.product.model.vo.Product;

public class Cart {
	
	private int cNo;
	private int mNo;
	private int pNo;
	private int cQty;
	private Product product;
	private String oDeliveryEDate;
	private String pName;
	private int pPrice;
	private String pImage1;
	
	public Cart() {
		// TODO Auto-generated constructor stub
	}

	public Cart(int cNo, int mNo, int pNo, int cQty, Product product, String oDeliveryEDate) {
		super();
		this.cNo = cNo;
		this.mNo = mNo;
		this.pNo = pNo;
		this.cQty = cQty;
		this.product = product;
		this.oDeliveryEDate = oDeliveryEDate;
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



	public Product getProduct() {
		return product;
	}



	public void setProduct(Product product) {
		this.product = product;
	}






	public String getoDeliveryEDate() {
		return oDeliveryEDate;
	}






	public void setoDeliveryEDate(String oDeliveryEDate) {
		this.oDeliveryEDate = oDeliveryEDate;
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
		return "Cart [cNo=" + cNo + ", mNo=" + mNo + ", pNo=" + pNo + ", cQty=" + cQty + ", product=" + product
				+ ", oDeliveryEDate=" + oDeliveryEDate + ", pName=" + pName + ", pPrice=" + pPrice + ", pImage1="
				+ pImage1 + "]";
	}

	
	
	

}
