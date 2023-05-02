package model;

public class Cart {
	private String memId;
	private int goodCode;
	private int cartQuantity;
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getGoodCode() {
		return goodCode;
	}
	public void setGoodCode(int goodCode) {
		this.goodCode = goodCode;
	}
	public int getCartQuantity() {
		return cartQuantity;
	}
	public void setCartQuantity(int cartQuantity) {
		this.cartQuantity = cartQuantity;
	}
	@Override
	public String toString() {
		return "Cart [memId=" + memId + ", goodCode=" + goodCode + ", cartQuantity=" + cartQuantity + "]";
	}
	

}