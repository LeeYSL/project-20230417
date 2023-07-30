package model;

public class Point {
	private int pointCode;
	private String pointName;
	private int pointPrice;
	private String pointImg;
	public int getPointCode() {
		return pointCode;
	}
	public void setPointCode(int pointCode) {
		this.pointCode = pointCode;
	}
	public String getPointName() {
		return pointName;
	}
	public void setPointName(String pointName) {
		this.pointName = pointName;
	}
	public int getPointPrice() {
		return pointPrice;
	}
	public void setPointPrice(int pointPrice) {
		this.pointPrice = pointPrice;
	}
	public String getPointImg() {
		return pointImg;
	}
	public void setPointImg(String pointImg) {
		this.pointImg = pointImg;
	}
	@Override
	public String toString() {
		return "Point [pointCode=" + pointCode + ", pointName=" + pointName + ", pointPrice=" + pointPrice
				+ ", pointImg=" + pointImg + "]";
	}
	
}
