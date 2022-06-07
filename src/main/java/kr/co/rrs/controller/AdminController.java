package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.AdminService;

@Controller
@RequestMapping("/admin")
public class AdminController {

	
	@Autowired // Singleton
	AdminService service; // Service


	// 회원검색결과
	@GetMapping("/resultMember")
	public String resultMember(String id, Model model) {
		model.addAttribute("id", id);
		model.addAttribute("memberList", service.searchMember(id));
		return "admin/resultMember";
	}

	// 지점검색결과
	@GetMapping("/resultStore")
	public String resultStore(String storeName, Model model) {
		model.addAttribute("storeName", storeName);
		model.addAttribute("storeList", service.searchStore(storeName));
		return "admin/resultStore";
	}

	// 회원검색
	@GetMapping("/searchMember")
	public String seachMember() {
		return "admin/searchMember";
	}

	// 지점검색
	@GetMapping("/searchStore")
	public String searchStore() {
		return "admin/searchStore";
	}
}
