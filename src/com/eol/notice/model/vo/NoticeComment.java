package com.eol.notice.model.vo;

import java.util.Date;

public class NoticeComment {
	
	private int nCommentNo;
	private int nCommentLevel;
	private String nCommentWriter;
	private String nCommentContent;
	private int nRef;
	private Date nCommnetDate;
	private int nCommentRef;
	
	public NoticeComment() {
		// TODO Auto-generated constructor stub
	}

	public NoticeComment(int nCommentNo, int nCommentLevel, String nCommentWriter, String nCommentContent, int nRef,
			Date nCommnetDate, int nCommentRef) {
		super();
		this.nCommentNo = nCommentNo;
		this.nCommentLevel = nCommentLevel;
		this.nCommentWriter = nCommentWriter;
		this.nCommentContent = nCommentContent;
		this.nRef = nRef;
		this.nCommnetDate = nCommnetDate;
		this.nCommentRef = nCommentRef;
	}

	public int getnCommentNo() {
		return nCommentNo;
	}

	public void setnCommentNo(int nCommentNo) {
		this.nCommentNo = nCommentNo;
	}

	public int getnCommentLevel() {
		return nCommentLevel;
	}

	public void setnCommentLevel(int nCommentLevel) {
		this.nCommentLevel = nCommentLevel;
	}

	public String getnCommentWriter() {
		return nCommentWriter;
	}

	public void setnCommentWriter(String nCommentWriter) {
		this.nCommentWriter = nCommentWriter;
	}

	public String getnCommentContent() {
		return nCommentContent;
	}

	public void setnCommentContent(String nCommentContent) {
		this.nCommentContent = nCommentContent;
	}

	public int getnRef() {
		return nRef;
	}

	public void setnRef(int nRef) {
		this.nRef = nRef;
	}

	public Date getnCommnetDate() {
		return nCommnetDate;
	}

	public void setnCommnetDate(Date nCommnetDate) {
		this.nCommnetDate = nCommnetDate;
	}

	public int getnCommentRef() {
		return nCommentRef;
	}

	public void setnCommentRef(int nCommentRef) {
		this.nCommentRef = nCommentRef;
	}

	@Override
	public String toString() {
		return "NoticeComment [nCommentNo=" + nCommentNo + ", nCommentLevel=" + nCommentLevel + ", nCommentWriter="
				+ nCommentWriter + ", nCommentContent=" + nCommentContent + ", nRef=" + nRef + ", nCommnetDate="
				+ nCommnetDate + ", nCommentRef=" + nCommentRef + "]";
	}
	
	

}
