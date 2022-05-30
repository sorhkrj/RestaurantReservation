package kr.co.rrs.controller;

import java.security.Principal;
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

	// @RequestMapping("/command") //GET or POST
	// public String function(HttpServletRequest request, Model model) {
	// 변수 생성 및 값 받기
	// 서비스 실행
	// model.addAttribute("변수", 변수); // "JSP에서 사용할 ${변수}"
	// return "실행할 페이지";
	// 실행만 하고 다음 화면으로 넘기고 싶을 때: return "redirect:/",
	// 기존의 정보를 가지고 다음 화면을 띄우고 싶을 때: return "forward:/"
	// }

	@Autowired // Singleton
	HomeService service; // Service

	@GetMapping("/")
	public String home(HttpSession session, Principal principal) {
		if (principal != null) {
			String nickName = service.selectNickname(principal.getName());
			session.setAttribute("nickName", nickName);
		} else {
			session.setAttribute("nickName", "메뉴");
		}
		return "index";
	}

	// security의 login과 겹쳐서 loginForm으로 수정(2022-05-26, 류성찬)
	@GetMapping("/loginForm")
	public String login() {
		return "loginForm";
	}
//	
//	//security에서 처리
//	@PostMapping("/loginPro")
//	public String loginPro(HttpServletRequest request, Model model) {
//		String id = request.getParameter("id");
//		String password = request.getParameter("password");
//		
//		MemberVO member = service.loginCheck(id, password);
//		if (member == null) {
//			return "redirect:login?loginFail=1";
//		}
//		
//		HttpSession session = request.getSession();
//		session.setAttribute("id", member.getId());
//		session.setAttribute("nickName", member.getNickname());
//		session.setAttribute("memberLevel", member.getMemberLevel());
//		session.setMaxInactiveInterval(300);
//		
//		return "redirect:/";
//	} 
//	
//	@GetMapping("/logout")
//	public String logout(HttpServletRequest request) {
//		request.getSession().invalidate();
//		return "redirect:/";
//	}

	@GetMapping("/searchResult")
	public String searchResult(HttpServletRequest request, Model model) {
		String search = request.getParameter("search");

		List<StoreVO> storeList = service.searchResultList(search);

		model.addAttribute("storeList", storeList);

		return "searchResult";
	}
}
