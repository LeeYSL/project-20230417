package Controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = { "/kgc/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class KgcController {

	@RequestMapping("main")
	public String writeForm() {
		return "kgc/main";
	}
}
