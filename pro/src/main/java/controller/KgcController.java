package controller;

import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.openqa.selenium.devtools.v110.profiler.model.Profile;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Game;
import model.KgcMybatisDao;
import model.Profileinfo;
import model.ProfileinfoMybatisDao;
import model.Record;

@WebServlet(urlPatterns = { "/kgc/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class KgcController extends MskimRequestMapping {
	private KgcMybatisDao kdao = new KgcMybatisDao();
	private ProfileinfoMybatisDao pdao = new ProfileinfoMybatisDao();
	private String gameYear;
	private Object gameDay;

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
		
		List<Game> gameDayList = kdao.gameDayList();
		request.setAttribute("gameDayList", gameDayList);	
		

		String leagueYear = request.getParameter("leagueYear");
		if(leagueYear == null) {
			leagueYear = "20222023";
		}
		List<Game> gameYearlist = kdao.gameYearlist(gameDay);
		request.setAttribute("gameYearlist", gameYearlist);
		return "kgc/game";
	}

	@RequestMapping("player")
	public String player(HttpServletRequest request, HttpServletResponse response) {
		      List<Profileinfo> list = pdao.list();
		      request.setAttribute("list", list);  
		return "kgc/player";
	}

	@RequestMapping("song")
	public String gosong(HttpServletRequest request, HttpServletResponse response) {
		return "kgc/song";
	}

}
