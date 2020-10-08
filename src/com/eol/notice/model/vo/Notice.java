package com.eol.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int nNumber;
	private String nWriter;
	private String nTitle;
	private String nContent;
	private String FilePath;
	private Date nRdate;
	private int nHit;
	
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}


	public Notice(int nNumber, String nWriter, String nTitle, String nContent, String filePath, Date nRdate, int nHit) {
		super();
		this.nNumber = nNumber;
		this.nWriter = nWriter;
		this.nTitle = nTitle;
		this.nContent = nContent;
		FilePath = filePath;
		this.nRdate = nRdate;
		this.nHit = nHit;
	}


	public int getnNumber() {
		return nNumber;
	}


	public void setnNumber(int nNumber) {
		this.nNumber = nNumber;
	}


	public String getnWriter() {
		return nWriter;
	}


	public void setnWriter(String nWriter) {
		this.nWriter = nWriter;
	}


	public String getnTitle() {
		return nTitle;
	}


	public void setnTitle(String nTitle) {
		this.nTitle = nTitle;
	}


	public String getnContent() {
		return nContent;
	}


	public void setnContent(String nContent) {
		this.nContent = nContent;
	}


	public String getFilePath() {
		return FilePath;
	}


	public void setFilePath(String filePath) {
		FilePath = filePath;
	}


	public Date getnRdate() {
		return nRdate;
	}


	public void setnRdate(Date nRdate) {
		this.nRdate = nRdate;
	}


	public int getnHit() {
		return nHit;
	}


	public void setnHit(int nHit) {
		this.nHit = nHit;
	}


	@Override
	public String toString() {
		return "Notice [nNumber=" + nNumber + ", nWriter=" + nWriter + ", nTitle=" + nTitle + ", nContent=" + nContent
				+ ", FilePath=" + FilePath + ", nRdate=" + nRdate + ", nHit=" + nHit + "]";
	}

	

	
}
