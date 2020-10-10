package com.eol.member.model.vo;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.eol.order.model.vo.Orders;

public class Point {
	
	private int mNo;
	private String poStatus;
	private int poNo;
	private Date poDate;
	private int poPoint;
	private List<Orders> orders = new ArrayList(); //결제 완료 시  주문에 대한 정보를 가지고 포인트를 적립한다.
	
	public Point() {
		// TODO Auto-generated constructor stub
	}

	public Point(int mNo, String poStatus, int poNo, Date poDate, int poPoint, List<Orders> orders) {
		super();
		this.mNo = mNo;
		this.poStatus = poStatus;
		this.poNo = poNo;
		this.poDate = poDate;
		this.poPoint = poPoint;
		this.orders = orders;
	}

	public int getmNo() {
		return mNo;
	}

	public void setmNo(int mNo) {
		this.mNo = mNo;
	}

	public String getPoStatus() {
		return poStatus;
	}

	public void setPoStatus(String poStatus) {
		this.poStatus = poStatus;
	}

	public int getPoNo() {
		return poNo;
	}

	public void setPoNo(int poNo) {
		this.poNo = poNo;
	}

	public Date getPoDate() {
		return poDate;
	}

	public void setPoDate(Date poDate) {
		this.poDate = poDate;
	}

	public int getPoPoint() {
		return poPoint;
	}

	public void setPoPoint(int poPoint) {
		this.poPoint = poPoint;
	}

	public List<Orders> getOrders() {
		return orders;
	}

	public void setOrders(List<Orders> orders) {
		this.orders = orders;
	}

	@Override
	public String toString() {
		return "Point [mNo=" + mNo + ", poStatus=" + poStatus + ", poNo=" + poNo + ", poDate=" + poDate + ", poPoint="
				+ poPoint + ", orders=" + orders + "]";
	}
	
	
	
	
}