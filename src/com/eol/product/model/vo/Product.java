package com.eol.product.model.vo;

import java.sql.Date;

public class Product {
	private int pNo;
	private String pName;
	private int pPrice;
	private int pDiscount;
	private int pStock;
	private String pImage1;
	private String pImage2;
	private String pImage3;
	private String pVidio;
	private String pDetail;
	private int pDelivery;
	private Date pRdate;
	private int pHit;
	private int pSell;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int pNo, String pName, int pPrice, int pDiscount, int pStock, String pImage1, String pImage2,
			String pImage3, String pVidio, String pDetail, int pDelivery, Date pRdate, int pHit, int pSell) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pStock = pStock;
		this.pImage1 = pImage1;
		this.pImage2 = pImage2;
		this.pImage3 = pImage3;
		this.pVidio = pVidio;
		this.pDetail = pDetail;
		this.pDelivery = pDelivery;
		this.pRdate = pRdate;
		this.pHit = pHit;
		this.pSell = pSell;
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

	public int getpDiscount() {
		return pDiscount;
	}

	public void setpDiscount(int pDiscount) {
		this.pDiscount = pDiscount;
	}

	public int getpStock() {
		return pStock;
	}

	public void setpStock(int pStock) {
		this.pStock = pStock;
	}

	public String getpImage1() {
		return pImage1;
	}

	public void setpImage1(String pImage1) {
		this.pImage1 = pImage1;
	}

	public String getpImage2() {
		return pImage2;
	}

	public void setpImage2(String pImage2) {
		this.pImage2 = pImage2;
	}

	public String getpImage3() {
		return pImage3;
	}

	public void setpImage3(String pImage3) {
		this.pImage3 = pImage3;
	}

	public String getpVidio() {
		return pVidio;
	}

	public void setpVidio(String pVidio) {
		this.pVidio = pVidio;
	}

	public String getpDetail() {
		return pDetail;
	}

	public void setpDetail(String pDetail) {
		this.pDetail = pDetail;
	}

	public int getpDelivery() {
		return pDelivery;
	}

	public void setpDelivery(int pDelivery) {
		this.pDelivery = pDelivery;
	}

	public Date getpRdate() {
		return pRdate;
	}

	public void setpRdate(Date pRdate) {
		this.pRdate = pRdate;
	}

	public int getpHit() {
		return pHit;
	}

	public void setpHit(int pHit) {
		this.pHit = pHit;
	}

	public int getpSell() {
		return pSell;
	}

	public void setpSell(int pSell) {
		this.pSell = pSell;
	}
}
