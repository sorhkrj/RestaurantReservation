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

	/* Controller 사용법 */
	// @Autowired // Singleton
	// Service service;
	
	//@Mapping("/command") //GET or POST
	//public String function() {
		// 변수 생성 및 값 받기
		// 명령 실행
		// Attribute("변수", 변수); // "JSP에서 사용할 ${변수}"
		// return "실행할 페이지";
	//}
	
	// page.jsp
	// <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
	
	@Autowired // Singleton
	HomeService service; // Service
	
	@GetMapping("/")
	public String home(HttpSession session) {
		String nickName = (String)session.getAttribute("nickName");
		
		String nickNameCheck = (nickName == null) ? "메뉴" : nickName;
		
		session.setAttribute("nickName", nickNameCheck);
		
		return "index";
	}
	
	@GetMapping("/login")
	public String login(Model model, HttpServletRequest request) {
		String loginFail = request.getParameter("loginFail");
		model.addAttribute("loginFail", loginFail);
		return "login";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(HttpServletRequest request, HttpSession session, Model model) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVO member = service.loginCheck(id);
		if (member != null) {
			if (password.equals(member.getPassword())) {
				session.setAttribute("id", member.getId());
				session.setAttribute("nickName", member.getNickname());
				session.setAttribute("memberLevel", member.getMemberLevel());
				session.setMaxInactiveInterval(60);
			} else {
				return "redirect:login?loginFail=1";
			}
		} else {
			return "redirect:login?loginFail=1";
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
		String search = request.getParameter("search");
		
		List<StoreVO> storeList = service.searchResultList(search);
		
		model.addAttribute("storeList", storeList);
		
		return "searchResult";
	}
}
