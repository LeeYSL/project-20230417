package model;

public class OrderItem {
  private int orderCode;
  private int goodsCode;
  private int cartQuantity;
  private String memId;
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
@Override
public String toString() {
	return "OrderItem [orderCode=" + orderCode + ", goodsCode=" + goodsCode + ", cartQuantity=" + cartQuantity
			+ ", memId=" + memId + "]";
}
  
}
