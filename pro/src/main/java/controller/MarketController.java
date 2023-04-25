package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = { "/market/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MarketController extends MskimRequestMapping {
	
	@RequestMapping("buyForm")
	public String goBuyForm() {
		return "member/buyForm";
	}
	@RequestMapping("cartForm")
	public String goCartForm() {
		return "member/cartForm";
	}
	@RequestMapping("marketForm")
	public String goMarketForm() {
		return "member/marketForm";
	}

	
}
