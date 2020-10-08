package com.eol.qna.model.vo;

public class QnaAnswer {
	
	private int qNo;
	private String aId;
	private String qaContent;
	
	public QnaAnswer() {
		// TODO Auto-generated constructor stub
	}

	public QnaAnswer(int qNo, String aId, String qaContent) {
		super();
		this.qNo = qNo;
		this.aId = aId;
		this.qaContent = qaContent;
	}

	public int getqNo() {
		return qNo;
	}

	public void setqNo(int qNo) {
		this.qNo = qNo;
	}

	public String getaId() {
		return aId;
	}

	public void setaId(String aId) {
		this.aId = aId;
	}

	public String getQaContent() {
		return qaContent;
	}

	public void setQaContent(String qaContent) {
		this.qaContent = qaContent;
	}

	@Override
	public String toString() {
		return "QnaAnswer [qNo=" + qNo + ", aId=" + aId + ", qaContent=" + qaContent + "]";
	}
	
	

}
