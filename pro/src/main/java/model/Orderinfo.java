package model;

import javax.management.loading.PrivateClassLoader;

public class Orderinfo {
	private String memId;
	private String memAddress;
	private int orderCode;
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
	@Override
	public String toString() {
		return "Orderinfo [memId=" + memId + ", memAddress=" + memAddress + ", orderCode=" + orderCode + "]";
	}

}