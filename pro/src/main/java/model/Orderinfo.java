package model;

import java.util.Date;

public class Orderinfo {
	private String memId;
	private String memAddress;
	private int orderCode;
	private Date orderDate;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemAddress() {
		return memAddress;
	}
	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}
	public int getOrderCode() {
		return orderCode;
	}
	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}
	
	public Date getOrderDate() {
		return orderDate;
	}
	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}
	@Override
	public String toString() {
		return "Orderinfo [memId=" + memId + ", memAddress=" + memAddress + ", orderCode=" + orderCode + ", orderDate="
				+ orderDate + "]";
	}


}