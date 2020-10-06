package com.eol.notice.model.vo;

import java.sql.Date;

public class Notice {
	private int NoticeNumber;
	private int NoticeadminNumber;
	private String NoticeWriter;
	private String NoticeTitle;
	private String NoticeContent;
	private String FilePath;
	private Date NoticeEnrollDate;
	private int NoticeHit;
	
	
	public Notice() {
		// TODO Auto-generated constructor stub
	}


	public Notice(int noticeNumber, int noticeadminNumber, String noticeWriter, String noticeTitle,
			String noticeContent, String filePath, Date noticeEnrollDate, int noticeHit) {
		super();
		NoticeNumber = noticeNumber;
		NoticeadminNumber = noticeadminNumber;
		NoticeWriter = noticeWriter;
		NoticeTitle = noticeTitle;
		NoticeContent = noticeContent;
		FilePath = filePath;
		NoticeEnrollDate = noticeEnrollDate;
		NoticeHit = noticeHit;
	}


	public int getNoticeNumber() {
		return NoticeNumber;
	}


	public void setNoticeNumber(int noticeNumber) {
		NoticeNumber = noticeNumber;
	}


	public int getNoticeadminNumber() {
		return NoticeadminNumber;
	}


	public void setNoticeadminNumber(int noticeadminNumber) {
		NoticeadminNumber = noticeadminNumber;
	}


	public String getNoticeWriter() {
		return NoticeWriter;
	}


	public void setNoticeWriter(String noticeWriter) {
		NoticeWriter = noticeWriter;
	}


	public String getNoticeTitle() {
		return NoticeTitle;
	}


	public void setNoticeTitle(String noticeTitle) {
		NoticeTitle = noticeTitle;
	}


	public String getNoticeContent() {
		return NoticeContent;
	}


	public void setNoticeContent(String noticeContent) {
		NoticeContent = noticeContent;
	}


	public String getFilePath() {
		return FilePath;
	}


	public void setFilePath(String filePath) {
		FilePath = filePath;
	}


	public Date getNoticeEnrollDate() {
		return NoticeEnrollDate;
	}


	public void setNoticeEnrollDate(Date noticeEnrollDate) {
		NoticeEnrollDate = noticeEnrollDate;
	}


	public int getNoticeHit() {
		return NoticeHit;
	}


	public void setNoticeHit(int noticeHit) {
		NoticeHit = noticeHit;
	}


	@Override
	public String toString() {
		return "Notice [NoticeNumber=" + NoticeNumber + ", NoticeadminNumber=" + NoticeadminNumber + ", NoticeWriter="
				+ NoticeWriter + ", NoticeTitle=" + NoticeTitle + ", NoticeContent=" + NoticeContent + ", FilePath="
				+ FilePath + ", NoticeEnrollDate=" + NoticeEnrollDate + ", NoticeHit=" + NoticeHit + "]";
	}


}
