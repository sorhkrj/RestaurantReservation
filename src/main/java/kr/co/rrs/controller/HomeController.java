package kr.co.rrs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.context.request.WebRequest;

import kr.co.rrs.service.SessionService;
import kr.co.rrs.vo.MemberVO;

@Controller
public class HomeController {
	
	@Autowired
	SessionService sessionService;
	
	@GetMapping("/")
	public String home(HttpSession session) {
		String nickName = (String)session.getAttribute("nickName");
		String nickNameCheck = (nickName == null) ? "메뉴" : nickName;
		session.setAttribute("nickName", nickNameCheck);
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		return "login";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(HttpSession session, WebRequest request) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberVO member = sessionService.loginCheck(id);
		if (password.equals(member.getPassword())) {
			session.setAttribute("id", member.getId()); //테스트 코드
			session.setAttribute("nickName", member.getNickname()); //테스트 코드
			session.setAttribute("memberLevel", member.getMemberLevel()); //테스트 코드
			session.setMaxInactiveInterval(1);
		}
		return "redirect:/";
	}
	
	@PostMapping("/logout")
	public String logout() {
		return "redirect:/";
	}
	
	@GetMapping("/searchResult")
	public String searchResult() {
		return "searchResult";
	}
}
