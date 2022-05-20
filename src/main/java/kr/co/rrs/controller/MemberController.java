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
	
	//회원가입
	@GetMapping("/memberInsert") 
	public String memberInsert() {
		return "member/memberInsert";
	}
	//내정보
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
	//지점장 회원가입
	@GetMapping("/memberInsertEnterprise")
	public String memberInsertEnterprise() {
		return "member/memberInsertEnterprise";
	}
	//회원검색결과
	@GetMapping("/resultMember")
	public String resultMember() {
		return "member/resultMember";
	}
	//지점검색결과
	@GetMapping("/resultStore")
	public String resultStore() {
		return "member/resultStore";
	}
	//회원검색
	@GetMapping("/searchMember")
	public String seachMember() {
		return "member/searchMember";
	}
	//지점검색
	@GetMapping("/searchStore")
	public String searchStore() {
		return "member/searchStore";
	}
	//회원탈퇴
	@GetMapping("/memberDeleteCheck")
	public String memberDeleteCheck() {
		return "member/memberDeleteCheck";
	}
	
	@GetMapping("/memberDelete")
	public String memberDelete(MemberVO password) {
		memberService.delete(password);
		return "redirect:/";
	}
	
	//회원수정
	@GetMapping("/memberUpdateCheck")
	public String memberUpdateCheck() {
		return "member/memberUpdateCheck";
	}

}
