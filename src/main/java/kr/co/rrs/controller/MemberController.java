package kr.co.rrs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.MemberVO;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;


	@GetMapping("/memberInsert")
	public String memberInsert() {
		return "member/memberInsert";
	}
	
	@GetMapping("/memberSelect")
	public String memberSelect(Model model) {
		model.addAttribute("memberVO", memberService.selectOne("yoon"));
		return "member/memberSelect";
	}

	@GetMapping("/memberInsertPro")
	public String memberInsertPro(MemberVO memberVO) {
		memberService.insert(memberVO);
		return "forward:memberSelect";
	}


	@GetMapping("/memberInsertEnterprise")
	public String memberInsertEnterprise() {
		return "member/memberInsertEnterprise";
	}


	@GetMapping("/resultMember")
	public String resultMember() {
		return "member/resultMember";
	}

	
	@GetMapping("/resultStore")
	public String resultStore() {
		return "member/resultStore";
	}

	
	@GetMapping("/searchMember")
	public String seachMember() {
		return "member/searchMember";
	}


	@GetMapping("/searchStore")
	public String searchStore() {
		return "member/searchStore";
	}

	

	
	@GetMapping("/memberDeleteCheck")
	public String memberDeleteCheck() {
		return "member/memberDeleteCheck";
	}

	
	@GetMapping("/memberUpdateCheck")
	public String memberUpdateCheck() {
		return "member/memberUpdateCheck";
	}

}