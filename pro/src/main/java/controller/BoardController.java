package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.print.DocFlavor.STRING;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Board;
import model.BoardMybatisDao;

@WebServlet(urlPatterns = { "/board/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class BoardController extends MskimRequestMapping {
	private BoardMybatisDao dao = new BoardMybatisDao();

	
	/*
	 * 2. num값의 게시물을 db에서 조회. Board b =BoardDao.selectOne(num) 
	 * 3. num값의 게시물의 조회수 증가시키기 void BoardDao.readcntAdd(num)
	 * 4. 조회된 게시물 화면에 출력.
	 */
	@RequestMapping("boardList")
	public String boardList(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		if (request.getParameter("boardId") != null) { //만약 boardid 가 null 이 아니면
    		request.getSession().setAttribute("boardId", request.getParameter("boardId")); //보드 아이디를 가져와서 boardid라는 변수에 넣고
    		request.getSession().setAttribute("pageNum", "1"); //기본 번호를 1로 설정
    	}
    	String boardId = (String) request.getSession().getAttribute("boardId"); //보드 id 기준으로 가져온 정보를 가져와서 boardid라는 변수에 넣고
    	if(boardId == null) {
    		boardId ="NOTICE"; // url에 id 값이 없으면 기본 notice 로 하고 1페이지 뜨게 설정
    	}
    	
		int pageNum = 1; 
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		} 
		int limit =10;
		
		int boardCount = dao.boardCount(boardId); // 게시판 종류별 전체 게시물 수 리턴
		
		List<Board> list = dao.list(boardId, pageNum, limit);//list를 만들건데 board 타입을 넣어서 만든다.
		request.setAttribute("list", list);
		return "board/boardList";
	}

	@RequestMapping("writeForm")
	public String writeForm(HttpServletRequest request, HttpServletResponse response) {
		String boardId = (String) request.getSession().getAttribute("boardId"); // session의 boardId값을 가져온다.
		if (boardId == null) {
			boardId = "NOTICE";
		}
		String login = (String) request.getSession().getAttribute("login"); //session의 login값 가져온다.
		if (boardId.equals("NOTICE")) {
			if (login == null || !login.equals("admin")) {// 로그인이 안돼있거나 관리자가 아니라면
				request.setAttribute("msg", "관리자만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		if (boardId.equals("FAN")) {
			if (login == null) {
				request.setAttribute("msg", "선수만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		if (boardId.equals("PLAYER")) {
			if (login == null) {
				request.setAttribute("msg", "회원만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		return "board/writeForm";

	}

	@RequestMapping("write")
	public String write(HttpServletRequest request, HttpServletResponse response) {
		String path = request.getServletContext().getRealPath("/") + "/upload/board/";
		//getServletContext() : ServletContext 객체를 가져온다
		//getRealPath("/") : 지정한 path에 해당되는 실제 경로를 반환
		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, size, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		} // 파일업로드끝
			// 파라미터 Board 객체에 저장
		Board board = new Board(); //db board의 객체를 만든다?
		board.setBoardTitle(multi.getParameter("title")); //name이 title인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		board.setBoardContent(multi.getParameter("content"));//name이 content인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		board.setBoardFile(multi.getFilesystemName("file"));//name이 file인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		String boardId = (String) request.getSession().getAttribute("boardId");//세션에서 boardid값을 가져온다
		String id = (String) request.getSession().getAttribute("login");
		if (boardId == null)
			boardId = "NOTICE"; //boardId값이 없을경우 boardId는 NOTICE로 한다
		board.setBoardId(boardId); //세션에서 가져온 boardid 값을 board 객체의 boardid에 저장 
		board.setMemId(id); //세션에서 가져온 id값을 board 객체의 memid에 저장한다
		
		if (board.getBoardFile() == null)
			board.setBoardFile(""); // 업로드 파일이 없는 경우 빈문자열
		int num = dao.maxnum(); // 등록된 게시글의 최대 num 값
		board.setBoardNum(++num); //최대값 +1
		board.setBoardGrp(num); //grp컬럼 : 최초 게시물의 번호
		if (dao.insert(board)) { //board 테이블에 게시물 등록했을경우
			return "redirect:boardList?boardId=" + boardId; // 등록되면 list로 전달
		}
		// 게시물 등록 실패시 실행되는 부분
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", request.getContextPath() + "/board/writeForm");
		return "alert/alert";
	}
	

}
