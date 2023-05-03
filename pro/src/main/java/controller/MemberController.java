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
		System.out.println("********************* " + id);
		if (id != null) {
			String showId = id.substring(0, id.length() - 2) + "**";
			request.setAttribute("showId", showId); // 가져온 id를 잘라서 **를 포함해서 showid 넣고 member/id로 리턴함
		} else {
			request.setAttribute("msg", "아이디를 찾을 수 없습니다.");
			request.setAttribute("url", "idForm");
			return "alert/alert";

		}

		return "member/id";
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
		Member mem = dao.selectLogin(id, pass);
		String msg = null;
		String url = null;
		if(mem==null) {
		 msg="아이디 또는 비밀번호를 확인하세요";
		 url="loginForm";
		}else {
			 request.getSession().setAttribute("login", id);
			 request.getSession().setAttribute("memType", mem.getMemPosition());
			 msg = "반갑습니다." + mem.getMemName() + "님";
			 url = "info";
//			 url = "../kgc/main";
		 }
		
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return "alert/alert";
	}
	
	@RequestMapping("info")
	public String info(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/info";
	}
	
	@RequestMapping("pwForm")
	public String goPwForm() {
		return "member/pwForm";
	}

	
	@RequestMapping("update")
	public String update(HttpServletRequest request,
			HttpServletResponse response) {
		Member mem = new Member();
		mem.setMemPw(request.getParameter("pass1"));  //변경할 비밀번호
		mem.setMemName(request.getParameter("name"));
		mem.setMemPhone(request.getParameter("tel"));		
		mem.setMemAdress(request.getParameter("adress"));
		mem.setMemEmail(request.getParameter("email"));
		
		String login =(String) request.getSession().getAttribute("login");
		
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");	// 변경 전 입력하는 비밀번호
		Member dbMem = dao.selectLogin(id, pass);
		
		String msg = "비밀번호가 틀렸습니다.";
		String url ="updateForm?id=" + mem.getMemId();
		
		if (pass.equals(dbMem.getMemPw())) {
			if(dao.update(mem)) {
				msg = "회원정보 수정 완료";
				url= "info?id=" + mem.getMemId();
				
			}else {
				msg = "회원정보 수정 실패";
			}
			
	}
	request.setAttribute("msg", msg);
	request.setAttribute("url", url);
	return "alert";

	}
	
	@RequestMapping("logout")
	public String logout(HttpServletRequest request, HttpServletResponse response) {
		request.getSession().invalidate(); //invalidate(): 모든내용이 없어짐
		return "redirect:loginForm"; // 로그인폼으로 페이지 이동 만약 return "member/loginFrom" 으로 하면 로그아웃 했을때 url logout으로 됨
		// return request.sendRedirect("loginForm") == return "redirect:loginForm"

	}
	
	/*
	 * 1. id 파라미터값을 조회 2. 로그인 상태 검증 - 로그아웃상태 : '로그인하세요' 메세지 출력 후 loginForm 페이지 호출 -
	 * 로그인 상태 : - 다른 id 조회시(관리자 제외) : '내정보만 수정 가능합니다.' 메세지 출력 후 main 호출 3. db에서 id에
	 * 해당하는 데이터 조회하기 4. 조회된 내용 화면 출력하기 => 이전데이터를 화면 출력. 수정전화면 출력
	 */
	@RequestMapping("updateForm")
	public String updateForm(HttpServletRequest request, HttpServletResponse response) {
		String id = (String)request.getSession().getAttribute("login");
		Member mem = dao.selectOne(id);
		request.setAttribute("mem", mem);
		return "member/updateForm";
	}

}
