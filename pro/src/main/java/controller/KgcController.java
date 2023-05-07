package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = { "/kgc/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class KgcController extends MskimRequestMapping {

	@RequestMapping("main")
	public String goMain(HttpServletRequest request, HttpServletResponse response) {
		return "kgc/main";
	}
	
	@RequestMapping("map")
	public String goMap(HttpServletRequest request, HttpServletResponse response) {
		return "kgc/map";
	}

	@RequestMapping("kgcInfo")
	public String gokgcInfo(HttpServletRequest request, HttpServletResponse response) {
		return "kgc/kgcInfo";
	}

	@RequestMapping("player")
	public String goplayer(HttpServletRequest request, HttpServletResponse response) {
		return "kgc/player";
	}

	@RequestMapping("song")
	public String gosong(HttpServletRequest request, HttpServletResponse response) {
		return "kgc/song";
	}

}
