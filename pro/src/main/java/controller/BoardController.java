package controller;

import java.io.File;
import java.io.IOException;

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

	@RequestMapping("boardList")
	public String boardList(HttpServletRequest request, HttpServletResponse response) {
		String boardId = request.getParameter("boardId");//서블릿에서 전달된 boardId 데이터 가져오기
		if (boardId == null)
			boardId = "NOTICE";
		request.getSession().setAttribute("boardId", boardId); 
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
		Board board = new Board();
		board.setBoardTitle(multi.getParameter("title"));
		board.setBoardContent(multi.getParameter("content"));
		board.setBoardFile(multi.getFilesystemName("file"));
		String boardId = (String) request.getSession().getAttribute("boardId");
		String id = (String) request.getSession().getAttribute("login");
		if (boardId == null)
			boardId = "NOTICE"; //boardId값이 없을경우 boardId는 NOTICE로 한다
		board.setBoardId(boardId);
		board.setMemId(id);
		
		if (board.getBoardFile() == null)
			board.setBoardFile(""); // 업로드 파일이 없는 경우 빈문자열
		int num = dao.maxnum(); // 등록된 게시글의 최대 num 값
		board.setBoardNum(++num); //최대값 +1
		board.setBoardGrp(num); //grp컬럼 : 최초 게시물의 번호
		if (dao.insert(board)) { //board 테이블에 게시물 등록했을경우
			return "redirect:boardList?boardid=" + boardId; // 등록되면 list로 전달
		}
		// 게시물 등록 실패시 실행되는 부분
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", request.getContextPath() + "/board/writeForm");
		return "alert/alert";
	}

	/*
	 * 1. num 파라미터 저장. session에서 boardid 조회하기. 
	 * 2. num값의 게시물을 db에서 조회. Board b =BoardDao.selectOne(num) 
	 * 3. num값의 게시물의 조회수 증가시키기 void BoardDao.readcntAdd(num)
	 * 4. 조회된 게시물 화면에 출력.
	 */
//	@RequestMapping("boardInfo")
//	public String boardInfo(HttpServletRequest request, HttpServletResponse response) {
//			// 1 : 파라미터 저장
//			int num = Integer.parseInt(request.getParameter("boardNum")); // 게시물번호
//			// session에서 boardid 조회하기.
//			String readcnt = request.getParameter("boardReadCnt");
//			String boardid = (String) request.getSession().getAttribute("boardId");
//			// boardid 는 세션에서 속성으로 등록되어있음
//			if (boardid == null)
//				boardid = "1";
//
//			// b : board 테이블에서 num(조회하는 게시물번호)에 해당하는 데이터 저장
//			Board b = dao.selectOne(num);
//			if(readcnt == null || !readcnt.equals("f"))
//
//			// 3
//			dao.boardReadCntAdd(num);
//			request.setAttribute("b", b);
//			request.setAttribute("boardid", boardid);
//			String boardName = "공지사항";
//			switch (boardid) {
//			case "2":
//				boardName = "자유게시판";
//				break;
//			case "3":
//				boardName = "Q&A";
//				break;
//			}
//			request.setAttribute("boardName", boardName);
//			// 댓글 목록 화면에 전달
//			List<Comment> commlist = cdao.list(num); // commlist 에는 num에 해당하는 댓글 목록 가지고 있음
//			request.setAttribute("b", b);
//			request.setAttribute("boardid", boardid);
//			request.setAttribute("boardName", boardName);
//			request.setAttribute("commlist", commlist);
//			return "board/info";
//		}

	

}
