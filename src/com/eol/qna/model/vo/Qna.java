package com.eol.qna.model.vo;

import java.sql.Date;

public class Qna {

	private int qNo;
	private int oNo;
	private String qCategory;
	private String qTitle;
	private String qContent;
	private String qfile;
	private Date qRdate;
	private int mNo; 
	private String qAnswer;
	private String qStatus;
	private String mId;
	private String answerResult;
	private String answerDate;
	
	public Qna() {
		// TODO Auto-generated constructor stub
	}

	public Qna(int qNo, int oNo, String qCategory, String qTitle, String qContent, String qfile, Date qRdate, int mNo,
			String qAnswer, String qStatus) {
		super();
		this.qNo = qNo;
		this.oNo = oNo;
		this.qCategory = qCategory;
		this.qTitle = qTitle;
		this.qContent = qContent;
		this.qfile = qfile;
		this.qRdate = qRdate;
		this.mNo = mNo;
		this.qAnswer = qAnswer;
		this.qStatus = qStatus;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public int getoNo() {
		return oNo;
	}

	public void setoNo(int oNo) {
		this.oNo = oNo;
	}

	public String getqCategory() {
		return qCategory;
	}

	public void setqCategory(String qCategory) {
		this.qCategory = qCategory;
	}

	public String getqTitle() {
		return qTitle;
	}

	public void setqTitle(String qTitle) {
		this.qTitle = qTitle;
	}

	public String getqContent() {
		return qContent;
	}

	public void setqContent(String qContent) {
		this.qContent = qContent;
	}

	public String getqFile() {
		return qfile;
	}

	public void setqFile(String qfile) {
		this.qfile = qfile;
	}

	public Date getqRdate() {
		return qRdate;
	}

	public void setqRdate(Date qRdate) {
		this.qRdate = qRdate;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getqAnswer() {
		return qAnswer;
	}

	public void setqAnswer(String qAnswer) {
		this.qAnswer = qAnswer;
	}

	public String getqStatus() {
		return qStatus;
	}

	public void setqStatus(String qStatus) {
		this.qStatus = qStatus;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}
	
	public String getAnswerResult() {
		return answerResult;
	}

	public void setAnswerResult(String answerResult) {
		this.answerResult = answerResult;
	}

	public String getAnswerDate() {
		return answerDate;
	}

	public void setAnswerDate(String answerDate) {
		this.answerDate = answerDate;
	}

	@Override
	public String toString() {
		return "Qna [qNo=" + qNo + ", oNo=" + oNo + ", qCategory=" + qCategory + ", qTitle=" + qTitle + ", qContent="
				+ qContent + ", qfile=" + qfile + ", qRdate=" + qRdate + ", mNo=" + mNo + ", qAnswer=" + qAnswer
				+ ", qStatus=" + qStatus + "]";
	}

}
