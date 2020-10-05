package com.eol.member.model.vo;

import java.sql.Date;

public class Member {

	private int mNo;
	private String mId;
	private String mPw;
	private String mName;
	private String mBirth;
	private String mEmail;
	private String mPhone;
	private String mAddress;
	private String mGender;
	private int mLevel;
	private int mBuy;
	private int mDrop;
	private Date mEdate;
	private int mPonint;
	
	public Member() {
		// TODO Auto-generated constructor stub
	}

	public Member(int mNo, String mId, String mPw, String mName, String mBirth, String mEmail, String mPhone,
			String mAddress, String mGender, int mLevel, int mBuy, int mDrop, Date mEdate, int mPonint) {
		super();
		this.mNo = mNo;
		this.mId = mId;
		this.mPw = mPw;
		this.mName = mName;
		this.mBirth = mBirth;
		this.mEmail = mEmail;
		this.mPhone = mPhone;
		this.mAddress = mAddress;
		this.mGender = mGender;
		this.mLevel = mLevel;
		this.mBuy = mBuy;
		this.mDrop = mDrop;
		this.mEdate = mEdate;
		this.mPonint = mPonint;
	}
	

	public int getmNo() {
		return mNo;
	}


	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getmId() {
		return mId;
	}

	public void setmId(String mId) {
		this.mId = mId;
	}

	public String getmPw() {
		return mPw;
	}

	public void setmPw(String mPw) {
		this.mPw = mPw;
	}

	public String getmName() {
		return mName;
	}

	public void setmName(String mName) {
		this.mName = mName;
	}

	public String getmBirth() {
		return mBirth;
	}

	public void setmBirth(String mBirth) {
		this.mBirth = mBirth;
	}

	public String getmEmail() {
		return mEmail;
	}

	public void setmEmail(String mEmail) {
		this.mEmail = mEmail;
	}

	public String getmPhone() {
		return mPhone;
	}

	public void setmPhone(String mPhone) {
		this.mPhone = mPhone;
	}

	public String getmAddress() {
		return mAddress;
	}

	public void setmAddress(String mAddress) {
		this.mAddress = mAddress;
	}

	public String getmGender() {
		return mGender;
	}

	public void setmGender(String mGender) {
		this.mGender = mGender;
	}

	public int getmLevel() {
		return mLevel;
	}

	public void setmLevel(int mLevel) {
		this.mLevel = mLevel;
	}

	public int getmBuy() {
		return mBuy;
	}

	public void setmBuy(int mBuy) {
		this.mBuy = mBuy;
	}

	public int getmDrop() {
		return mDrop;
	}

	public void setmDrop(int mDrop) {
		this.mDrop = mDrop;
	}

	public Date getmEdate() {
		return mEdate;
	}

	public void setmEdate(Date mEdate) {
		this.mEdate = mEdate;
	}

	public int getmPonint() {
		return mPonint;
	}

	public void setmPonint(int mPonint) {
		this.mPonint = mPonint;
	}

	@Override
	public String toString() {
		return "Member [mNo=" + mNo + ", mId=" + mId + ", mPw=" + mPw + ", mName=" + mName + ", mBirth=" + mBirth
				+ ", mEmail=" + mEmail + ", mPhone=" + mPhone + ", mAddress=" + mAddress + ", mGender=" + mGender
				+ ", mLevel=" + mLevel + ", mBuy=" + mBuy + ", mDrop=" + mDrop + ", mEdate=" + mEdate + ", mPonint="
				+ mPonint + "]";
	}
	
	
}
