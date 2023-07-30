package controller;

import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.AccountMybatisDao;
import model.Member;
import model.MemberMybatisDao;

@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MemberController extends MskimRequestMapping {
	private MemberMybatisDao dao = new MemberMybatisDao();
	private AccountMybatisDao accountdao = new AccountMybatisDao();
	
	@RequestMapping("idSearch")
	public String idSearch(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String email = request.getParameter("email");
		String name = request.getParameter("name");

		String id = dao.idSearch(email, name); // dao에서 email,name 으로 찾아낸 id를 가져와서 String id에 담아줌
		if (id != null) {
			String showId = id.substring(0, id.length() - 3) + "**";
			request.setAttribute("showId", showId); // 가져온 id를 잘라서 **를 포함해서 showid 넣고 member/id로 리턴함
		} else {
			request.setAttribute("msg", "아이디를 찾을 수 없습니다.");
			request.setAttribute("url", "idForm");
			return "alert/alert";

		}

		return "member/id";
	}

	@RequestMapping("pwSearch")
	public String pwSearch(HttpServletRequest request, HttpServletResponse repResponse) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String email = request.getParameter("email");

		String pw = dao.pwSearch(id, email, name);
		if (pw != null) {
			String showPass = pw.substring(0, 2) + "**";
			request.setAttribute("showPass", showPass);
		} else {
			request.setAttribute("msg", "비밀번호를 찾을 수 없습니다.");
			request.setAttribute("url", "pwForm");
			return "alert/alert";

		}
		return "member/pw";

	}

	@RequestMapping("idForm")
	public String goIdForm(HttpServletRequest request, HttpServletResponse response) {
		return "member/idForm";
	}

	@RequestMapping("joinForm")
	public String goJoinForm(HttpServletRequest request, HttpServletResponse response) {
		return "member/joinForm";
	}

	@RequestMapping("join")
	public String join(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		Member mem = new Member();
		mem.setMemId(request.getParameter("id"));
		mem.setMemPw(request.getParameter("pass"));
		mem.setMemName(request.getParameter("name"));
		mem.setMemPhone(request.getParameter("tel"));
		mem.setMemAdress(request.getParameter("adress"));
		mem.setMemEmail(request.getParameter("email"));
		mem.setMemPosition(Integer.parseInt(request.getParameter("type")));
		mem.setMemPoint(30000);
		if (dao.insert(mem)) {
			request.setAttribute("msg", mem.getMemName() + "님 회원가입을 축하합니다.");
			request.setAttribute("url", "loginForm");
			accountdao.insert(mem.getMemId());
		} else {
			request.setAttribute("msg", mem.getMemName() + "님 회원가입 시 오류 발생되었습니다.");
			request.setAttribute("url", "joinForm");
		}
		return "alert/alert";
	}

	@RequestMapping("list")
	public String list(HttpServletRequest request, HttpServletResponse response) {
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

		int memberCount = dao.memberCount(); // 게시판 종류별 전체 게시물 수 리턴

		List<Member> list = dao.list(pageNum, limit);// list를 만들건데 board 타입을 넣어서 만든다.

		int maxpage = (int) ((double) memberCount / limit + 0.95);
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
		int boardnum = memberCount - (pageNum - 1) * limit;

		request.setAttribute("list", list);
		request.setAttribute("startpage", startpage);
		request.setAttribute("endpage", endpage);
		request.setAttribute("maxpage", maxpage);
		request.setAttribute("boardnum", boardnum);
		request.setAttribute("pageNum", pageNum);
	
		
		return "member/list";
	}

	@RequestMapping("loginForm")
	public String goLoginForm(HttpServletRequest request, HttpServletResponse response) {
		return "member/loginForm";
	}

	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		Member mem = dao.selectLogin(id, pass);
		String msg = null;
		String url = null;
		if (mem == null) {
			msg = "아이디 또는 비밀번호를 확인하세요";
			url = "loginForm";
		} else {
			request.getSession().setAttribute("login", id);
			msg = "반갑습니다." + mem.getMemName() + "님";

			url = "../kgc/main";
		}

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";
	}

	@RequestMapping("info")
	public String info(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/info";
	}

	@RequestMapping("pwForm")
	public String goPwForm(HttpServletRequest request, HttpServletResponse response) {
		return "member/pwForm";
	}

	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String) request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/updateForm";
	}

	@RequestMapping("update")
	public String update(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = (String) request.getSession().getAttribute("login");

		Member mem = new Member();
		mem.setMemId(id);
		mem.setMemPw(request.getParameter("pass1")); // 변경할 비밀번호
		mem.setMemName(request.getParameter("name"));
		mem.setMemPhone(request.getParameter("tel"));
		mem.setMemAdress(request.getParameter("adress"));
		mem.setMemEmail(request.getParameter("email"));

		System.out.println(mem);

		String pass = request.getParameter("pass"); // 변경 전 입력하는 비밀번호
		Member dbMem = dao.selectOne(id);

		mem.setMemPosition(dbMem.getMemPosition()); // 회원 유형
		mem.setMemPoint(dbMem.getMemPoint()); // 회원 포인트

		String msg = "비밀번호가 틀렸습니다.";
		String url = "updateForm";

		if (pass.equals(dbMem.getMemPw())) {
			if (dao.update(mem)) {
				msg = "회원정보 수정 완료";
				url = "info";
			} else {
				msg = "회원정보 수정 실패";
			}

		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";

	}

	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate(); // invalidate(): 모든내용이 없어짐
		return "redirect:loginForm";

	}

	@RequestMapping("deleteForm")
	public String deleteForm(HttpServletRequest request, HttpServletResponse response) {
		return "member/deleteForm";
	}

	@RequestMapping("delete")
	public String delete(HttpServletRequest request, HttpServletResponse response) {
		String pass = request.getParameter("pass");
		String id = (String) request.getSession().getAttribute("login"); // id값이 들어있나?
		String msg = null;
		String url = null;
		if (id.equals("admin")) {
			request.setAttribute("msg", "관리자는 탈퇴 불가능");
			request.setAttribute("url", "list");
			return "alert/alert";
		}

		Member dbMem = dao.selectOne(id); // 로그인된 사용자의 정보를 id로 조회해서 가져와?
		if (!pass.equals(dbMem.getMemPw())) {
			request.setAttribute("msg", "비밀번호 오류");
			request.setAttribute("url", "delteForm");
			return "alert/alert";
		}
		if (dao.delete(id)) {// id를 기준으로 지워
			msg = id + "고객님 탈퇴 성공";
			request.setAttribute("msg", msg);
			request.setAttribute("url", "/pro");
			request.getSession().invalidate(); // 모든 내용이 없어진다.
			return "alert/alert";

		}

		return null;
	}

	@RequestMapping("idChk")
	public String idChk(HttpServletRequest request, HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		String id = request.getParameter("id"); // 입력 받은 id를 가져와
		Member mem = dao.selectOne(id);
		String msg = null;
		boolean able = true;

		if (mem == null) {
			msg = "사용가능한 아이디 입니다.";
		} else {
			msg = "이미 사용중인 아이디 입니다.";
			able = false;

		}

		request.setAttribute("able", able);
		request.setAttribute("msg", msg);
		return "member/idChk";

	}
}
