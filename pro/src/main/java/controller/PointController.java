package controller;

import java.io.File;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Account;
import model.AccountMybatisDao;
import model.Member;
import model.MemberMybatisDao;
import model.Point;
import model.PointMybatisDao;

@WebServlet(urlPatterns = { "/point/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class PointController extends MskimRequestMapping {
	private PointMybatisDao pointdao = new PointMybatisDao();
	private AccountMybatisDao accountdao = new AccountMybatisDao();
	private MemberMybatisDao dao = new MemberMybatisDao();

	@RequestMapping("pointList")
	public String pointList(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("pageNum", "1");
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int pointCount = pointdao.pointCount(); // 게시판 종류별 전체 게시물 수 리턴

		List<Point> list = pointdao.list(pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) pointCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = pointCount - (pageNum - 1) * limit;

		request.setAttribute("list", list);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		
		return "point/pointList";
	}
	
	
	@RequestMapping("point")
	public String write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String path = request.getServletContext().getRealPath("/") + "/upload/point/";
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
		
		Point point = new Point(); // db goods의 객체를 만든다?
		point.setPointCode(Integer.parseInt(multi.getParameter("code")));
		point.setPointPrice(Integer.parseInt(multi.getParameter("price")));
		point.setPointName(multi.getParameter("name"));// name이 content인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		point.setPointImg(multi.getFilesystemName("file"));// name이 file인 파라미터 값을 보드객체의 BoardTitle에 저장한다.
		String id = (String) request.getSession().getAttribute("login");
		request.getSession().setAttribute("point", point); // 세션저장
		if(!id.equals("admin") || id ==null) {
			request.setAttribute("msg", "관리자만 사용 가능합니다.");
			request.setAttribute("url", request.getContextPath() + "/kgc/main");
			return "alert/alert";			
		}	
		if (pointdao.insert(point)) { 
			return "redirect:pointBuy"; 
		}
		
		// 게시물 등록 실패시 실행되는 부분
		request.setAttribute("msg", "게시물 등록 실패");
		request.setAttribute("url", request.getContextPath() + "/point/pointForm");
		return "alert/alert";
	}
	
	@RequestMapping("pointBuy") // 장바구니 추가 누르면 여기로 옴
	public String pointBuy(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		int code = Integer.parseInt(request.getParameter("code"));
		Point point = pointdao.selectOne(code);
		request.setAttribute("point", point);

		String id = (String) request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		if(id == null) {
			request.setAttribute("msg", "로그인 해야 합니다.");
			request.setAttribute("url", request.getContextPath() + "/member/loginForm");
			return "alert/alert";			
		}	
		
		return "point/pointBuy";
	}
	@RequestMapping("kakao") // 장바구니 추가 누르면 여기로 옴
	public String kakao(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}

		int code = Integer.parseInt(request.getParameter("code"));
		Point point = pointdao.selectOne(code);
		request.setAttribute("point", point);

		String id = (String) request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		int pointPrice = Integer.parseInt(request.getParameter("pointPrice"));
		int memPoint = Integer.parseInt(request.getParameter("memPoint")); 
		String name = request.getParameter("name"); 
		String memId = request.getParameter("memId");
		if(id == null) {
			request.setAttribute("msg", "로그인 해야 합니다.");
			request.setAttribute("url", request.getContextPath() + "/member/loginForm");
			return "alert/alert";			
		}	
		request.setAttribute("mem", mem);

		
		dao.addpoint(pointPrice,memPoint,memId);
		accountdao.pointinsert(memId,pointPrice,name,memPoint);
		return "point/kakao";
	
	}

	@RequestMapping("pointAccount")
	public String pointAccount(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = (String) request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		
		request.getSession().setAttribute("pageNum", "1");
		int pageNum = 1;
		try {
			pageNum = Integer.parseInt(request.getParameter("pageNum"));
		} catch (NumberFormatException e) {
		}
		int limit = 10;

		int accountCount = accountdao.accountCount(id); // 게시판 종류별 전체 게시물 수 리턴

		List<Account> list = accountdao.accounntlist(id,pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) accountCount / limit + 0.95);
		/*
		 * startpage : 화면에 출력될 시작 페이지 현재페이지 | 시작페이지 1 1 1/10.0 => 0.1 + 0.9 => (int)1.0
		 * -1 => 0 * 10 +1 => 1 10 1 11 11 505 501 int startpage= ((int)(pageNum/10.0 +
		 * 0.9) -1)*10 +1; //10.0 -> 한페이지에 10개 보여줌
		 */
		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;
		/*
		 * endpage : 화면에 출력할 마지막 페이지 번호. 한 화면에 10개의 페이지를 보여줌
		 */
		int endpage = startpage + 9;
		// endpage 는 maxpage를 넘어가면 안됨
		if (endpage > maxpage)
			endpage = maxpage;

		// 글 번호
		int boardnum = accountCount - (pageNum - 1) * limit;

		request.setAttribute("list", list);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
		
		return "point/pointAccount";
	}
	

}


