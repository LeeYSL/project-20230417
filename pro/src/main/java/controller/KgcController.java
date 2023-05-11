package controller;

import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Game;
import model.KgcMybatisDao;
import model.Record;

@WebServlet(urlPatterns = { "/kgc/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class KgcController extends MskimRequestMapping {
	private KgcMybatisDao kdao = new KgcMybatisDao();
	private String gameYear;

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
		//연도리스트 조회
		List<Record> yearList = kdao.yearList();
		request.setAttribute("yearList", yearList);	
		
		//구단기록 데이터리스트 조회
		String leagueYear = request.getParameter("leagueYear");
		if(leagueYear == null) {
			leagueYear = "20222023";
		}
		List<Record> recordList = kdao.list(leagueYear);
		request.setAttribute("recordList", recordList);
		return "kgc/kgcInfo";
	}
	@RequestMapping("Game")
	public String goGame(HttpServletRequest request, HttpServletResponse response) {
		
		List<Game> gameDaylist = kdao.gameDaylist(gameDay);
		request.setAttribute("gameDaylist", gameDaylist);	
		

		String leagueYear = request.getParameter("leagueYear");
		if(leagueYear == null) {
			leagueYear = "20222023";
		}
		List<Record> recordList = kdao.list(leagueYear);
		request.setAttribute("recordList", recordList);
		return "kgc/game";
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
