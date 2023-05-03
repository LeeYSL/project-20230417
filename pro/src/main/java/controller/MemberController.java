package controller;

import java.io.UnsupportedEncodingException;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;
import model.Member;
import model.MemberMybatisDao;

@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MemberController extends MskimRequestMapping {
	private MemberMybatisDao dao = new MemberMybatisDao();
	
	@RequestMapping("idChk")
	public String goIdChk() {
		return "member/idChk";
	}
	
	@RequestMapping("idForm")
	public String goIdForm() {
		return "member/idForm";
	}
	
	@RequestMapping("joinForm")
	public String goJoinForm() {
		return "member/joinForm";
	}
	
	@RequestMapping("join")
	public String join(HttpServletRequest request ,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		}catch (UnsupportedEncodingException e) {
			  e.printStackTrace();
		}
		Member mem = new Member();
		mem.setMemId(request.getParameter("id"));
		mem.setMemPw(request.getParameter("pass1"));
		mem.setMemName(request.getParameter("name"));
		mem.setMemPhone(request.getParameter("tel"));		
		mem.setMemAdress(request.getParameter("adress"));
		mem.setMemEmail(request.getParameter("email"));
		mem.setMemPosition(Integer.parseInt(request.getParameter("type")));
		mem.setMemPoint(3000);
		if (dao.insert(mem)) {
			request.setAttribute("msg", mem.getMemName() + "님 회원가입을 축하합니다.");
			request.setAttribute("url", "loginForm");
		}else {
			request.setAttribute("msg", mem.getMemName() + "님 회원가입 시 오류 발생되었습니다.");
			request.setAttribute("url", "joinForm");
		}
		return "alert/alert";
	} 
	
	
	@RequestMapping("list")
	public String goList() {
		return "member/list";
	}
	
	@RequestMapping("loginForm")
	public String goLoginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("login")
	public String login(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");	
		Member mem = dao.selectOne(id, pass);
		String msg = null;
		String url = null;
		if(mem==null) {
		 msg="아이디 또는 비밀번호를 확인하세요";
		 url="loginForm";
		}else {
			 request.getSession().setAttribute("login", id);
			 request.getSession().setAttribute("memType", mem.getMemPosition());
			 msg = "반갑습니다." + mem.getMemName() + "님";
			 url = "../kgc/main";
		 }
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";
	}
	
	@RequestMapping("pwForm")
	public String goPwForm() {
		return "member/pwForm";
	}
	
	@RequestMapping("update")
	public String update() {
		return "loginForm";
	}

}
