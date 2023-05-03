package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Member;
import model.MemberMybatisDao;

@WebServlet(urlPatterns = { "/market/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MarketController extends MskimRequestMapping {
	private MemberMybatisDao dao = new MemberMybatisDao();
	@RequestMapping("buyForm")
	public String buyForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem",mem);
		return "market/buyForm";
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
