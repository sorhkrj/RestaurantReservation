package kr.co.rrs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.rrs.service.HomeService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

@Controller
public class HomeController {
	
	@Autowired
	HomeService homeService;
	
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
	public String loginPro(HttpServletRequest request, HttpSession session) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		MemberVO member = homeService.loginCheck(id);
		if (password.equals(member.getPassword())) {
			session.setAttribute("id", member.getId());
			session.setAttribute("nickName", member.getNickname());
			session.setAttribute("memberLevel", member.getMemberLevel());
			session.setMaxInactiveInterval(60);
		}
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.setAttribute("id", null);
		session.setAttribute("nickName", null);
		session.setAttribute("memberLevel", null);
		session.setMaxInactiveInterval(0);
		return "redirect:/";
	}
	
	@GetMapping("/searchResult")
	public String searchResult(Model model, HttpServletRequest request) {
		List<StoreVO> storeList = homeService.searchResultList();
		model.addAttribute("storeList", storeList);
		return "searchResult";
	}
}
