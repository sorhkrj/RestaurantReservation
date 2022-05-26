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
	
	//@RequestMapping("/command") //GET or POST
	//public String function(HttpServletRequest request, Model model) {
		// 변수 생성 및 값 받기
		// 서비스 실행
		// model.addAttribute("변수", 변수); // "JSP에서 사용할 ${변수}"
		// return "실행할 페이지";
	// 실행만 하고 다음 화면으로 넘기고 싶을 때: return "redirect:/", 
	// 기존의 정보를 가지고 다음 화면을 띄우고 싶을 때: return "forward:/"
	//}
	
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
	public String login(HttpServletRequest request, Model model) {
		String loginFail = request.getParameter("loginFail");
		
		model.addAttribute("loginFail", loginFail);
		
		return "login";
	}
	
	@PostMapping("/loginPro")
	public String loginPro(HttpServletRequest request, Model model) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberVO member = service.loginCheck(id, password);
		if (member == null) {
			return "redirect:login?loginFail=1";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("id", member.getId());
		session.setAttribute("nickName", member.getNickname());
		session.setAttribute("memberLevel", member.getMemberLevel());
		session.setMaxInactiveInterval(300);
		
		return "redirect:/";
	}
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest request) {
		request.getSession().invalidate();
		return "redirect:/";
	}
	
	@GetMapping("/searchResult")
	public String searchResult(HttpServletRequest request, Model model) {
		String search = request.getParameter("search");
		
		List<StoreVO> storeList = service.searchResultList(search);
		
		model.addAttribute("storeList", storeList);
		
		return "searchResult";
	}
}
