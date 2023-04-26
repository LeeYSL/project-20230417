package controller;

import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;

import gdu.mskim.MskimRequestMapping;
import gdu.mskim.RequestMapping;

@WebServlet(urlPatterns = { "/member/*" }, initParams = { @WebInitParam(name = "view", value = "/view/") })
public class MemberController extends MskimRequestMapping {
	
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
	
	@RequestMapping("list")
	public String goList() {
		return "member/list";
	}
	
	@RequestMapping("loginForm")
	public String goLoginForm() {
		return "member/loginForm";
	}
	
	@RequestMapping("pwForm")
	public String goPwForm() {
		return "member/pwForm";
	}
	

	

}
