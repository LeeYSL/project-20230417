package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mariadb.jdbc.util.log.ConsoleLogger;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.BoardMybatisDao;

@WebServlet(urlPatterns = {"/board/*"}, initParams = { @WebInitParam(name = "view", value="/view/") })
public class BoardController extends MskimRequestMapping {
	private BoardMybatisDao dao = new BoardMybatisDao();
	
	@RequestMapping("writeForm")
	public String writeForm(HttpServletRequest request, HttpServletResponse response) {
		String boardId = (String)request.getSession().getAttribute("boardId"); //session의 boardId값을 가져온다.
		if(boardId == null) {
			boardId="NOTICE";
		}
		String login =(String) request.getSession().getAttribute("login");
		if(boardId.equals("NOTICE")) {
			if(login ==null || !login.equals("admin")) {//로그인이 안돼있거나 관리자가 아니라면
				request.setAttribute("msg", "관리자만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		if(boardId.equals("FAN")) {
			if(login == null || !login.equals("2")) {
				request.setAttribute("msg", "선수만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		if(boardId.equals("PLAYER")) {
			if(login == null) {
				request.setAttribute("msg", "회원만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		return "board/writeForm";
		
	}
	@RequestMapping("boardList")
	public String goBoardList(HttpServletRequest request, HttpServletResponse response) {
		String boardId =request.getParameter("boardId");
		if(boardId==null) boardId= "NOTICE";
		request.getSession().setAttribute("boardId", boardId);
		return "board/boardList";
		
	}
	
	@RequestMapping("boardInfo")
	public String goBoardInfo(HttpServletRequest request, HttpServletResponse response) {
		return "board/boardInfo";
		
	}
	


}

