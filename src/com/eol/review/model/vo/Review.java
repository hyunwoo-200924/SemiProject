package com.eol.review.model.vo;

import java.sql.Date;

public class Review {
	private int rNo;
	private int pNo;
	private int oNo;
	private String rWriter;
	private String rTitle;
	private String rContent;
	private String rPhoto1;
	private String rPhoto2;
	private String rPhoto3;
	private Date rRdate;
	private int rStarScore;
	private String FilePath;
	
	public Review() {
		// TODO Auto-generated constructor stub
	}

	public Review(int rNo, int pNo, int oNo, String rWriter, String rTitle, String rContent, String rPhoto1,
			String rPhoto2, String rPhoto3, Date rRdate, int rStarScore, String filePath) {
		super();
		this.rNo = rNo;
		this.pNo = pNo;
		this.oNo = oNo;
		this.rWriter = rWriter;
		this.rTitle = rTitle;
		this.rContent = rContent;
		this.rPhoto1 = rPhoto1;
		this.rPhoto2 = rPhoto2;
		this.rPhoto3 = rPhoto3;
		this.rRdate = rRdate;
		this.rStarScore = rStarScore;
		FilePath = filePath;
	}

	public int getrNo() {
		return rNo;
	}

	public void setrNo(int rNo) {
		this.rNo = rNo;
	}

	public int getpNo() {
		return pNo;
	}

	public void setpNo(int pNo) {
		this.pNo = pNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public String getrWriter() {
		return rWriter;
	}

	public void setrWriter(String rWriter) {
		this.rWriter = rWriter;
	}

	public String getrTitle() {
		return rTitle;
	}

	public void setrTitle(String rTitle) {
		this.rTitle = rTitle;
	}

	public String getrContent() {
		return rContent;
	}

	public void setrContent(String rContent) {
		this.rContent = rContent;
	}

	public String getrPhoto1() {
		return rPhoto1;
	}

	public void setrPhoto1(String rPhoto1) {
		this.rPhoto1 = rPhoto1;
	}

	public String getrPhoto2() {
		return rPhoto2;
	}

	public void setrPhoto2(String rPhoto2) {
		this.rPhoto2 = rPhoto2;
	}

	public String getrPhoto3() {
		return rPhoto3;
	}

	public void setrPhoto3(String rPhoto3) {
		this.rPhoto3 = rPhoto3;
	}

	public Date getrRdate() {
		return rRdate;
	}

	public void setrRdate(Date rRdate) {
		this.rRdate = rRdate;
	}

	public int getrStarScore() {
		return rStarScore;
	}

	public void setrStarScore(int rStarScore) {
		this.rStarScore = rStarScore;
	}

	public String getFilePath() {
		return FilePath;
	}

	public void setFilePath(String filePath) {
		FilePath = filePath;
	}

	
}
