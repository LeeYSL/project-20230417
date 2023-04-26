package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = {"/board/*"}, initParams = { @WebInitParam(name = "view", value="/veiw/") })
public class BoardController extends MskimRequestMapping {
	
	@RequestMapping("boardList")
	public String goboardList() {
		return "board/boardList";
		
	}
	@RequestMapping("writeForm")
	public String gowriteForm() {
		return "board/writeForm";
		
	}
	
	@RequestMapping("boardInfo")
	public String goboardInfo() {
		return "board/boardInfo";
		
	}
	


}

