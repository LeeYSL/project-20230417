package model;

import java.util.Date;

public class OrderItem {
	private int orderCode;
	private int goodsCode;
	private int cartQuantity;
	private String memId;
	private int goodsPrice;
	private String memAddress;
	private String goodsImg;
	private String goodsName;
	private Date orderDate;
	

	public int getOrderCode() {
		return orderCode;
	}

	public void setOrderCode(int orderCode) {
		this.orderCode = orderCode;
	}

	public int getGoodsCode() {
		return goodsCode;
	}

	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}

	public int getCartQuantity() {
		return cartQuantity;
	}

	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}

	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}

	public int getGoodsPrice() {
		return goodsPrice;
	}

	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}

	public String getMemAddress() {
		return memAddress;
	}

	public void setMemAddress(String memAddress) {
		this.memAddress = memAddress;
	}

	public String getGoodsImg() {
		return goodsImg;
	}

	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}

	public String getGoodsName() {
		return goodsName;
	}

	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	@Override
	public String toString() {
		return "OrderItem [orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", cartQuantity=" + cartQuantity
				+ ", memId=" + memId + ", goodsPrice=" + goodsPrice + ", memAddress=" + memAddress + ", goodsImg="
				+ goodsImg + ", goodsName=" + goodsName + ", orderDate=" + orderDate + "]";
	}





}
