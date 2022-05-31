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
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@GetMapping("/signin")
	public String signin() {
		return "signin";
	}
	
	@GetMapping("/Test")
	@ResponseBody
	public String Test(String id) {
		System.out.println("id: " + id);
		String name = service.selectNickname(id);
		System.out.println("name: " + name);
		return name;
	}
	
	@GetMapping("/searchResult")
	public String searchResult(HttpServletRequest request, Model model) {
		String search = request.getParameter("search");

		List<StoreVO> storeList = service.searchResultList(search);

		model.addAttribute("storeList", storeList);

		return "searchResult";
	}
}
