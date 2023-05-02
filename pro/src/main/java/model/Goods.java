package model;

public class Goods {
	private int goodsCode;
	private String goodsName;
	private int goodsPrice;
	private String goodsImg;
	public int getGoodsCode() {
		return goodsCode;
	}
	public void setGoodsCode(int goodsCode) {
		this.goodsCode = goodsCode;
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
	@Override
	public String toString() {
		return "goods [goodsCode=" + goodsCode + ", goodsName=" + goodsName + ", goodsPrice=" + goodsPrice
				+ ", goodsImg=" + goodsImg + "]";
	}

}
