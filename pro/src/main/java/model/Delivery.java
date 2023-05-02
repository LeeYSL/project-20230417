package model;

public class Delivery {
	private String memId;
	private int deliveryNum;
	private String deliveryAddress;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getDeliveryNum() {
		return deliveryNum;
	}
	public void setDeliveryNum(int deliveryNum) {
		this.deliveryNum = deliveryNum;
	}
	public String getDeliveryAddress() {
		return deliveryAddress;
	}
	public void setDeliveryAddress(String deliveryAddress) {
		this.deliveryAddress = deliveryAddress;
	}
	@Override
	public String toString() {
		return "Delivery [memId=" + memId + ", deliveryNum=" + deliveryNum + ", deliveryAddress=" + deliveryAddress
				+ "]";
	}
	
}
