package model;

public class Cart {
	private String memId;
	private int cartQuantity;
	private String goodsName;
	private int goodsPrice;
	private String goodsImg;
	private int goodsCode;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public int getGoodsPrice() {
		return goodsPrice;
	}
	public void setGoodsPrice(int goodsPrice) {
		this.goodsPrice = goodsPrice;
	}
	public String getGoodsImg() {
		return goodsImg;
	}
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}
	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
	}
	@Override
	public String toString() {
		return "Cart [memId=" + memId + ", cartQuantity=" + cartQuantity + ", goodsName=" + goodsName + ", goodsPrice="
				+ goodsPrice + ", goodsImg=" + goodsImg + ", goodsCode=" + goodsCode + "]";
	}
	


}