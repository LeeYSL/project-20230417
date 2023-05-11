package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.print.DocFlavor.STRING;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.ibatis.annotations.Select;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import io.netty.handler.codec.http.HttpResponse;
import model.Board;
import model.BoardMybatisDao;
import model.Comment;
import model.CommentMybatisDao;
import model.Member;
import model.MemberMybatisDao;

//
@WebServlet(urlPatterns = { "/board/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class BoardController extends MskimRequestMapping {
	private BoardMybatisDao dao = new BoardMybatisDao();
	private CommentMybatisDao cdao = new CommentMybatisDao();
	private MemberMybatisDao mdao = new MemberMybatisDao();

	/*
	 * 2. num값의 게시물을 db에서 조회. Board b =BoardDao.selectOne(num) 3. num값의 게시물의 조회수
	 * 증가시키기 void BoardDao.readcntAdd(num) 4. 조회된 게시물 화면에 출력.
	 */
	@RequestMapping("boardList")
	public String boardList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		if (request.getParameter("boardId") != null) { // 만약 boardid 가 null 이 아니면
			request.getSession().setAttribute("boardId", request.getParameter("boardId")); // 보드 아이디를 가져와서 boardid라는 변수에
																							// 넣고
			request.getSession().setAttribute("pageNum", "1"); // 기본 번호를 1로 설정
		}
		String boardId = (String) request.getSession().getAttribute("boardId"); // 보드 id 기준으로 가져온 정보를 가져와서 boardid라는 변수에
																				// 넣고
		if (boardId == null) {
			boardId = "NOTICE"; // url에 id 값이 없으면 기본 notice 로 하고 1페이지 뜨게 설정
		}

		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int boardCount = dao.boardCount(boardId); // 게시판 종류별 전체 게시물 수 리턴

		List<Board> list = dao.list(boardId, pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) boardCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 + 1;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = boardCount - (pageNum - 1) * limit;

		request.setAttribute("list", list);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardId", boardId);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);

		return "board/boardList";
	}

	@RequestMapping("writeForm")
	public String writeForm(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String boardId = (String) request.getSession().getAttribute("boardId"); // session의 boardId값을 가져온다.
		String id = (String) request.getSession().getAttribute("login");
		// Member id = mdao.selectOne(id); 왜 안 돼?
		Member mem = mdao.selectOne(id);

		if (boardId == null) {
			boardId = "NOTICE";
		}
		// String login = (String) request.getSession().getAttribute("login"); //
		// session의 login값 가져온다.
		if (boardId.equals("NOTICE")) {
			if (id == null || 1 != (mem.getMemPosition())) {// 로그인이 안돼있거나 관리자가 아니라면
				request.setAttribute("msg", "관리자만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		if (boardId.equals("FAN")) {
			if (id == null || 2 != (mem.getMemPosition())) {
				request.setAttribute("msg", "선수만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		if (boardId.equals("PLAYER")) {
			if (id == null) {
				request.setAttribute("msg", "회원만 글쓰기가 가능합니다.");
				request.setAttribute("url", request.getContextPath() + "/board/boardList?boardId=" + boardId);
				return "alert/alert";
			}
		}
		return "board/writeForm";

	}

	@RequestMapping("write")
	public String write(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String path = request.getServletContext().getRealPath("/") + "/upload/board/";
		System.out.println("path : " + path);
		// getServletContext() : ServletContext 객체를 가져온다
		// getRealPath("/") : 지정한 path에 해당되는 실제 경로를 반환
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
		Board board = new Board(); // db board의 객체를 만든다?
		board.setBoardTitle(multi.getParameter("title")); // name이 title인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		board.setBoardContent(multi.getParameter("content"));// name이 content인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		board.setBoardFile(multi.getFilesystemName("file"));// name이 file인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		String boardId = (String) request.getSession().getAttribute("boardId");// 세션에서 boardid값을 가져온다
		String id = (String) request.getSession().getAttribute("login");
		if (boardId == null)
			boardId = "NOTICE"; // boardId값이 없을경우 boardId는 NOTICE로 한다
		board.setBoardId(boardId); // 세션에서 가져온 boardid 값을 board 객체의 boardid에 저장
		board.setMemId(id); // 세션에서 가져온 id값을 board 객체의 memid에 저장한다

		if (board.getBoardFile() == null)
			board.setBoardFile(""); // 업로드 파일이 없는 경우 빈문자열
		int num = dao.maxnum(); // 등록된 게시글의 최대 num 값
		board.setBoardNum(++num); // 최대값 +1
		board.setBoardGrp(num); // grp컬럼 : 최초 게시물의 번호
		if (dao.insert(board)) { // board 테이블에 게시물 등록했을경우
			return "redirect:boardList?boardId=" + boardId; // 등록되면 list로 전달
		}
		// 게시물 등록 실패시 실행되는 부분
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", request.getContextPath() + "/board/writeForm");
		return "alert/alert";
	}

	@RequestMapping("boardInfo")
	public String boardInfo(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
//		int commentNum =Integer.parseInt(request.getParameter("commentNum"));
//		int  boardTime =Integer.parseInt(request.getParameter("boardTime"));

		String boardId = (String) request.getSession().getAttribute("boardId");
		if (boardId == null)
			boardId = "NOTICE";

		Board b = dao.selectOne(boardNum);
		request.setAttribute("b", b);
		request.setAttribute("boardId", boardId);
//		request.setAttribute("boardTime", boardTime);

//		if(boardReadCnt==null || !boardReadCnt.equals("f"));
		List<Comment> commList = cdao.list(boardNum);
		System.out.println("commlist:" + commList);
		request.setAttribute("commList", commList);
		return "board/boardInfo";
	}

	@RequestMapping("comment")
	public String comment(HttpServletRequest request, HttpServletResponse response) {
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		// String memId = (String) request.getSession().getAttribute("login");
		String url = "boardInfo?boardNum=" + boardNum; // $readcnt=f"
		// request.setAttribute(memId, memId);

		Comment comm = new Comment();
		int commentNum = cdao.maxseq(boardNum);
		comm.setBoardNum(boardNum);
		comm.setCommentContent(request.getParameter("comment"));
		comm.setMemId(request.getParameter("memId"));
		String id = (String) request.getSession().getAttribute("login");
//		System.out.println("id:"+id); 왜 안찍어줘
		comm.setMemId(id);
		comm.setCommentNum(++commentNum);
//		request.getSession().setAttribute("comm", comm); comm 세션에 저장했는데 왜 null?

//    System.out.println("comm:" + comm);

		if (comm.getMemId() == null) {
			request.setAttribute("msg", "로그인 하셔야 댓글을 달 수 있습니다.");

		}
		if (cdao.insert(comm)) {
			return "redirect:" + url;
		}
		request.setAttribute("msg", "댓글 작성 시 오류 발생");
		request.setAttribute("url", url);
		return "alert/alert";

	}

	@RequestMapping("commdel")
	public String commdel(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
//		Comment comm = new Comment();
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
//		String commId = (String)request.getParameter("memId");
		String url = "boardInfo?boardNum=" + boardNum;
		String id = (String) request.getSession().getAttribute("login");

		System.out.println("boardNum:" + boardNum);
		System.out.println("commentNum:" + commentNum);

		Comment c = cdao.selectOne(boardNum, commentNum);
//		comm.setMemId(request.getParameter("memId"));
		System.out.println("c :" + c);

//		if(id == null) {
//			request.setAttribute("msg", "로그인 후 삭제 가");
//			request.setAttribute(url, url);
//		}
//			
//		if(id != null || id.equals(comm.getMemId())) {
//			msg = "로그인 하셔야 삭제 가능합니다.";
//			return "redirect:" + url;	
//		}
		if (!id.equals(c.getMemId())) {
			request.setAttribute("msg", "본인 댓글만 삭제 할 수 있습니다.");
			request.setAttribute("url", url);
			return "alert/alert";
		}
		if (cdao.delete(boardNum, commentNum)) {
			return "redirect:" + url;

		}
		request.setAttribute("msg", "아이디가 달라 삭제 불가능합니다.");
		request.setAttribute(url, url);
		return "alert/alert";

	}

	@RequestMapping("commupdate")
	public String commupdate(HttpServletRequest request, HttpServletResponse response) {

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		int commentNum = Integer.parseInt(request.getParameter("commentNum"));
		String commentContent = request.getParameter("commentContent");

		String msg = null;
		String url = "boardInfo?boardNum=" + boardNum;

		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {

			e.printStackTrace();
		}
		Comment c = cdao.selectOne(boardNum, commentNum);
		c.setBoardNum(boardNum);
		c.setCommentNum(commentNum);
		c.setCommentContent(commentContent);
		if (cdao.update(c)) {
			msg = "댓글 수정 완료";
			url = "boardInfo?boardNum=" + boardNum;
			return "redirect:" + url;
		} else {
			msg = "댓글 수정 실패";
			url = "boardInfo?boardNum=" + boardNum;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";
	}

	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String boardId = (String) request.getSession().getAttribute("boardId");
		if (boardId == null) {
			boardId = "NOTICE";
		}
		String id = (String) request.getSession().getAttribute("login");

		if (boardId.equals("NOTICE")) {
			if (id == null || !id.equals("admin")) {
				request.setAttribute("msg", "관리자만 수정 가능합니다");
				request.setAttribute("url", "boardList?boardId=NOTICE");
				return "alert/alert";
			}
		}
		Board b = dao.selectOne(boardNum);
		request.setAttribute("b", b);
		request.setAttribute("boardId", boardId);
		return "board/updateForm";
	}

	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		// 1
		Board board = new Board();
		String path = request.getServletContext().getRealPath("/") + "upload/board/file/";
		File f = new File(path);
		if (!f.exists()) {
			f.mkdirs();
		}
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		}

		int boardNum = Integer.parseInt(multi.getParameter("boardNum"));
		board.setMemId(multi.getParameter("name"));
		board.setBoardTitle(multi.getParameter("title"));
		board.setBoardContent(multi.getParameter("content"));
		board.setBoardNum(boardNum);

		// input type=file로 선택한 첨부파일이 없으면 기존의 첨부파일을 가져옴
		if (multi.getFilesystemName("file") == null) {
			board.setBoardFile(multi.getParameter("boardFile")); // DB첨부파일
		} else {
			board.setBoardFile(multi.getFilesystemName("file")); // 새로 첨부한 첨부파일
		}

		String msg;
		String url;
		// 3
		if (dao.update(board)) { // db의 게시물 수정
			msg = "게시물 수정 완료";
			url = "boardInfo?boardNum=" + board.getBoardNum();
			return "redirect:" + url;
		} else {
			msg = "게시물 수정 실패";
			url = "updateForm?boardNum=" + boardNum;
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";
	}

	@RequestMapping("deleteForm")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) {
		
		// request.setAttribute("boardNum", request.getParameter("boardNum"));
		return "board/deleteForm";
	}

	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));
		String id = (String) request.getSession().getAttribute("login");
		Board b = dao.selectOne(boardNum);
		String msg = null;
		String url = null;
		if (!id.equals(b.getMemId())) {
			msg = "아이디가 달라 삭제 불가능 합니다.";
			url = "boardInfo?boardNum=" + boardNum;

		} else {
			if (dao.delete(boardNum)) {
				msg = "삭제되었습니다.";
				url = "boardList?boardId=" + b.getBoardId();
			} else { // 삭제실패
				msg = "게시글 삭제 실패";
				url = "boardInfo?boardNum=" + boardNum;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";
	}
}
