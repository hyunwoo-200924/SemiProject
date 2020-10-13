package com.eol.product.model.vo;

import java.sql.Date;

public class Product {
	private int pNo;
	private String pName;
	private int pPrice;
	private int pDiscount;
	private int pStock;
	private int pServing;//인분
	private int pCooktime;//조리시간
	private int pReadytime;//준비시간
	private int pTaste;// 맛 1,2,3,4 보통 약간 중간 많이
	private String pImage1;
	private String pImage2;
	private String pImage3;
	private String pVideo;
	private String pDetailImage1;
	private String pDetailImage2;
	private String pDetailImage3;
	private String pDetailTitle1;
	private String pDetailTitle2;
	private String pDetailMain;
	private String pDetailContent1;
	private String pDetailContent2;
	private String pRecipeImage1;
	private String pRecipeImage2;
	private String pRecipeImage3;
	private String pRecipeImage4;
	private String pRecipeContent1;
	private String pRecipeContent2;
	private String pRecipeContent3;
	private String pRecipeContent4;
	private Date pRdate;
	private int pHit;
	private int pSell;
	private int pCount; // 상품 갯수 담기 위한 변수 -ys-
	private String delivery;
	
	public Product() {
		// TODO Auto-generated constructor stub
	}

	public Product(int pNo, String pName, int pPrice, int pDiscount, int pStock, int pServing, int pCooktime,
			int pReadytime, int pTaste, String pImage1, String pImage2, String pImage3, String pVideo,
			String pDetailImage1, String pDetailImage2, String pDetailImage3, String pDetailTitle1,
			String pDetailTitle2, String pDetailMain, String pDetailContent1, String pDetailContent2,
			String pRecipeImage1, String pRecipeImage2, String pRecipeImage3, String pRecipeImage4,
			String pRecipeContent1, String pRecipeContent2, String pRecipeContent3, String pRecipeContent4, Date pRdate,
			int pHit, int pSell, int pCount) {
		super();
		this.pNo = pNo;
		this.pName = pName;
		this.pPrice = pPrice;
		this.pDiscount = pDiscount;
		this.pStock = pStock;
		this.pServing = pServing;
		this.pCooktime = pCooktime;
		this.pReadytime = pReadytime;
		this.pTaste = pTaste;
		this.pImage1 = pImage1;
		this.pImage2 = pImage2;
		this.pImage3 = pImage3;
		this.pVideo = pVideo;
		this.pDetailImage1 = pDetailImage1;
		this.pDetailImage2 = pDetailImage2;
		this.pDetailImage3 = pDetailImage3;
		this.pDetailTitle1 = pDetailTitle1;
		this.pDetailTitle2 = pDetailTitle2;
		this.pDetailMain = pDetailMain;
		this.pDetailContent1 = pDetailContent1;
		this.pDetailContent2 = pDetailContent2;
		this.pRecipeImage1 = pRecipeImage1;
		this.pRecipeImage2 = pRecipeImage2;
		this.pRecipeImage3 = pRecipeImage3;
		this.pRecipeImage4 = pRecipeImage4;
		this.pRecipeContent1 = pRecipeContent1;
		this.pRecipeContent2 = pRecipeContent2;
		this.pRecipeContent3 = pRecipeContent3;
		this.pRecipeContent4 = pRecipeContent4;
		this.pRdate = pRdate;
		this.pHit = pHit;
		this.pSell = pSell;
		this.pCount = pCount;
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

	public int getpServing() {
		return pServing;
	}

	public void setpServing(int pServing) {
		this.pServing = pServing;
	}

	public int getpCooktime() {
		return pCooktime;
	}

	public void setpCooktime(int pCooktime) {
		this.pCooktime = pCooktime;
	}

	public int getpReadytime() {
		return pReadytime;
	}

	public void setpReadytime(int pReadytime) {
		this.pReadytime = pReadytime;
	}

	public int getpTaste() {
		return pTaste;
	}

	public void setpTaste(int pTaste) {
		this.pTaste = pTaste;
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

	public String getpVideo() {
		return pVideo;
	}

	public void setpVideo(String pVideo) {
		this.pVideo = pVideo;
	}

	public String getpDetailImage1() {
		return pDetailImage1;
	}

	public void setpDetailImage1(String pDetailImage1) {
		this.pDetailImage1 = pDetailImage1;
	}

	public String getpDetailImage2() {
		return pDetailImage2;
	}

	public void setpDetailImage2(String pDetailImage2) {
		this.pDetailImage2 = pDetailImage2;
	}

	public String getpDetailImage3() {
		return pDetailImage3;
	}

	public void setpDetailImage3(String pDetailImage3) {
		this.pDetailImage3 = pDetailImage3;
	}

	public String getpDetailTitle1() {
		return pDetailTitle1;
	}

	public void setpDetailTitle1(String pDetailTitle1) {
		this.pDetailTitle1 = pDetailTitle1;
	}

	public String getpDetailTitle2() {
		return pDetailTitle2;
	}

	public void setpDetailTitle2(String pDetailTitle2) {
		this.pDetailTitle2 = pDetailTitle2;
	}

	public String getpDetailMain() {
		return pDetailMain;
	}

	public void setpDetailMain(String pDetailMain) {
		this.pDetailMain = pDetailMain;
	}

	public String getpDetailContent1() {
		return pDetailContent1;
	}

	public void setpDetailContent1(String pDetailContent1) {
		this.pDetailContent1 = pDetailContent1;
	}

	public String getpDetailContent2() {
		return pDetailContent2;
	}

	public void setpDetailContent2(String pDetailContent2) {
		this.pDetailContent2 = pDetailContent2;
	}

	public String getpRecipeImage1() {
		return pRecipeImage1;
	}

	public void setpRecipeImage1(String pRecipeImage1) {
		this.pRecipeImage1 = pRecipeImage1;
	}

	public String getpRecipeImage2() {
		return pRecipeImage2;
	}

	public void setpRecipeImage2(String pRecipeImage2) {
		this.pRecipeImage2 = pRecipeImage2;
	}

	public String getpRecipeImage3() {
		return pRecipeImage3;
	}

	public void setpRecipeImage3(String pRecipeImage3) {
		this.pRecipeImage3 = pRecipeImage3;
	}

	public String getpRecipeImage4() {
		return pRecipeImage4;
	}

	public void setpRecipeImage4(String pRecipeImage4) {
		this.pRecipeImage4 = pRecipeImage4;
	}

	public String getpRecipeContent1() {
		return pRecipeContent1;
	}

	public void setpRecipeContent1(String pRecipeContent1) {
		this.pRecipeContent1 = pRecipeContent1;
	}

	public String getpRecipeContent2() {
		return pRecipeContent2;
	}

	public void setpRecipeContent2(String pRecipeContent2) {
		this.pRecipeContent2 = pRecipeContent2;
	}

	public String getpRecipeContent3() {
		return pRecipeContent3;
	}

	public void setpRecipeContent3(String pRecipeContent3) {
		this.pRecipeContent3 = pRecipeContent3;
	}

	public String getpRecipeContent4() {
		return pRecipeContent4;
	}

	public void setpRecipeContent4(String pRecipeContent4) {
		this.pRecipeContent4 = pRecipeContent4;
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

	public int getpCount() {
		return pCount;
	}

	public void setpCount(int pCount) {
		this.pCount = pCount;
	}

	public String getDelivery() {
		return delivery;
	}
	
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	
	
//	@Override
//	public String toString() {
//		return "Product [pNo=" + pNo + ", pName=" + pName + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount
//				+ ", pStock=" + pStock + ", pServing=" + pServing + ", pCooktime=" + pCooktime + ", pReadytime="
//				+ pReadytime + ", pTaste=" + pTaste + ", pImage1=" + pImage1 + ", pImage2=" + pImage2 + ", pImage3="
//				+ pImage3 + ", pVideo=" + pVideo + ", pDetailImage1=" + pDetailImage1 + ", pDetailImage2="
//				+ pDetailImage2 + ", pDetailImage3=" + pDetailImage3 + ", pDetailTitle1=" + pDetailTitle1
//				+ ", pDetailTitle2=" + pDetailTitle2 + ", pDetailMain=" + pDetailMain + ", pDetailContent1="
//				+ pDetailContent1 + ", pDetailContent2=" + pDetailContent2 + ", pRecipeImage1=" + pRecipeImage1
//				+ ", pRecipeImage2=" + pRecipeImage2 + ", pRecipeImage3=" + pRecipeImage3 + ", pRecipeImage4="
//				+ pRecipeImage4 + ", pRecipeContent1=" + pRecipeContent1 + ", pRecipeContent2=" + pRecipeContent2
//				+ ", pRecipeContent3=" + pRecipeContent3 + ", pRecipeContent4=" + pRecipeContent4 + ", pRdate=" + pRdate
//				+ ", pHit=" + pHit + ", pSell=" + pSell + ", pCount=" + pCount + "]";
//	}
	


	@Override
	public String toString() {
		return "Product [pNo=" + pNo + ", pCount=" + pCount + "]";
	}
	
	
	
	
	
}
