package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = {"/board/*"}, initParams = { @WebInitParam(name = "view", value="/view/") })
public class BoardController extends MskimRequestMapping {
	
	@RequestMapping("boardList")
	public String goBoardList(HttpServletRequest request, HttpServletResponse response) {
		return "board/boardList";
		
	}
	@RequestMapping("writeForm")
	public String goWriteForm() {
		return "board/writeForm";
		
	}
	
	@RequestMapping("boardInfo")
	public String goBoardInfo() {
		return "board/boardInfo";
		
	}
	


}

