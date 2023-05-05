package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

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
		//1.boardId 파라미터 저장. session에서 boardId 조회하기
		if(request.getParameter("boardId") != null) {
			request.getSession().setAttribute("boardId", request.getParameter("boardId"));//boardid파라미터값을 세션의 boardid에 저장?
//			request.getSession().setAttribute("pageNum", "1"); // 현재페이지 번호
		}
		String boardId = request.getParameter("boardId");//서블릿에서 전달된 boardId 데이터 가져오기
		if (boardId == null)
			boardId = "NOTICE";
		int pageNum= 1; // 페이지 넘버 1로 설정
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		} // 페이지 넘버 1 로 할거다 -> 오류 무시할거다
		
//	//	request.getSession().setAttribute("boardId", boardId); //세션에 boardid에 boardid 저장해라
//
//		try {
//			request.setCharacterEncoding("UTF-8");
//		} catch (UnsupportedEncodingException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}//post 타입이라? // 안적으면 게시판 검색할때 한글 깨짐 
//		
//			
//		int limit = 10; // 한페이지에 보여질 게시물 건수 > 한페이지에 10 개만 보여줄거다
//	
//		// boardcount : 게시물종류별 게시물 등록 건수
//		int boardCount = dao.boardCount(boardId); // 게시판 종류별 전체 게시물등록 건수 리턴
//		// list : 현재 페이지에 보여질 게시물 목록.
//		List<Board> list = dao.list(boardId, pageNum, limit); //column,find 추가
//		/*
//		 * maxpage : 필요한 페이지 갯수. 게미물 건수 | 필요한 페이지 3 1 3.0/10 => 0.3 + 0.95 => (int)1.25
//		 * =>1 10 1 10.0/10 =>1.0 + 0.95 => (int)1.95 =>1 13 2 501 51
//		 */
//		int maxpage = (int) ((double) boardCount / limit + 0.95);
//		/*
//		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
//		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
//		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
//		 */
//		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
//		/*
//		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
//		 */
//		int endpage = startpage + 9;
//		// endpage 는 maxpage를 넘어가면 안됨
//		if (endpage > maxpage)
//			endpage = maxpage;
//
//		int boardNum = boardCount - (pageNum - 1) * limit;
//		request.setAttribute("boardCount", boardCount);
//		request.setAttribute("boardId", boardId);
//		request.setAttribute("pageNum", pageNum);
//		request.setAttribute("boardNum", boardNum);
//		request.setAttribute("list", list);
//		request.setAttribute("startpage", startpage);
//		request.setAttribute("endpage", endpage);
//		request.setAttribute("maxpage", maxpage);
//		request.setAttribute("today", new Date());
		boardId = (String)request.getSession().getAttribute("boardId");
		
		Board b = dao.selectOne(boardId);
		request.setAttribute("b", b);

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
			return "redirect:boardList?boardid=" + boardId; // 등록되면 list로 전달
		}
		// 게시물 등록 실패시 실행되는 부분
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", request.getContextPath() + "/board/writeForm");
		return "alert/alert";
	}



	

}
