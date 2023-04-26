package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = { "/kgc/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class KgcController extends MskimRequestMapping {

	@RequestMapping("main")
	public String goMain() {
		return "kgc/main";
	}
	
	@RequestMapping("map")
	public String goMap() {
		return "kgc/map";
	}

	@RequestMapping("kgcInfo")
	public String gokgcInfo() {
		return "kgc/kgcInfo";
	}

	@RequestMapping("player")
	public String goplayer() {
		return "kgc/player";
	}

	@RequestMapping("song")
	public String gosong() {
		return "kgc/song";
	}

}
