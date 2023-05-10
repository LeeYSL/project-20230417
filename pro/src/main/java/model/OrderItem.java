package model;

public class OrderItem {
	private int orderCode;
	private int goodsCode;
	private int cartQuantity;
	private String memId;
	private int goodsPrice;
	private String memAdress;
	private String goodsImg;
	private String goodsName;
	

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

	/**
	 * @return the memAddress
	 */
	public String getMemAdress() {
		return memAdress;
	}

	/**
	 * @param memAddress the memAddress to set
	 */
	public void setMemAddress(String memAdress) {
		this.memAdress = memAdress;
	}

	/**
	 * @return the goodsImg
	 */
	public String getGoodsImg() {
		return goodsImg;
	}

	/**
	 * @param goodsImg the goodsImg to set
	 */
	public void setGoodsImg(String goodsImg) {
		this.goodsImg = goodsImg;
	}

	/**
	 * @return the goodsName
	 */
	public String getGoodsName() {
		return goodsName;
	}

	/**
	 * @param goodsName the goodsName to set
	 */
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}

	@Override
	public String toString() {
		return "OrderItem [orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", cartQuantity=" + cartQuantity
				+ ", memId=" + memId + ", goodsPrice=" + goodsPrice + ", memAdress=" + memAdress + ", goodsImg="
				+ goodsImg + ", goodsName=" + goodsName + "]";
	}



}
