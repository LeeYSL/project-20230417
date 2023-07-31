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

		int pointCount = pointdao.pointCount(); 

		List<Point> list = pointdao.list(pageNum, limit);

		int maxpage = (int) ((double) pointCount / limit + 0.95);

		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;

		int endpage = startpage + 9;
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
		request.setAttribute("pointCount", pageNum);
		return "point/pointList";
	}
	@RequestMapping("pointForm")
	public String pointForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Member loginMem = (Member)request.getSession().getAttribute("loginMem");
		if(loginMem.getMemPosition() != 1 ) {
			request.setAttribute("msg", "관리자만 사용 가능합니다.");
			request.setAttribute("url", request.getContextPath() + "/kgc/main");
		}
		return "alert/alert";			
	}	
	
	@RequestMapping("point")
	public String write(HttpServletRequest request, HttpServletResponse response) throws Exception {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String path = request.getServletContext().getRealPath("/") + "/upload/point/";

		File f = new File(path);
		if (!f.exists())
			f.mkdirs();
		int size = 10 * 1024 * 1024;
		MultipartRequest multi = null;
		try {
			multi = new MultipartRequest(request, path, size, "UTF-8");
		} catch (IOException e) {
			e.printStackTrace();
		} 
			
		
		Point point = new Point(); 
		point.setPointCode(Integer.parseInt(multi.getParameter("code")));
		point.setPointPrice(Integer.parseInt(multi.getParameter("price")));
		point.setPointName(multi.getParameter("name"));
		point.setPointImg(multi.getFilesystemName("file"));

		request.getSession().setAttribute("point", point); 
		Member loginMem = (Member)request.getSession().getAttribute("loginMem");
		if(loginMem.getMemPosition() != 1 ) {
			request.setAttribute("msg", "관리자만 사용 가능합니다.");
			request.setAttribute("url", request.getContextPath() + "/kgc/main");
		}
		if (pointdao.insert(point)) { 
			return "redirect:pointBuy"; 
		}
		

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

		int accountCount = accountdao.accountCount(id); 

		List<Account> list = accountdao.accounntlist(id,pageNum, limit);

		int maxpage = (int) ((double) accountCount / limit + 0.95);

		int startpage = ((int) (pageNum / 10.0 + 0.9) - 1) * 10 +1 ;

		int endpage = startpage + 9;

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


