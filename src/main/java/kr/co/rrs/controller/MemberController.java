package kr.co.rrs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

@Controller
public class MemberController {

	private final MemberService memberService;
	
	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	//회원가입
	@GetMapping("/memberInsert") 
	public String memberInsert() {
		return "member/memberInsert";
	}
	@GetMapping("/memberInsertPro")
	public String memberInsertPro(MemberVO memberVO) {
		memberService.insert(memberVO);
		return "forward:/";
	}
	//내정보
	@GetMapping("/memberSelect")
	public String memberSelect(Model model, HttpSession session) {
		String id = (String) session.getAttribute("id");
		MemberVO memberVO = memberService.selectOne(id);
		model.addAttribute("memberVO", memberVO);
		return "member/memberSelect";
	}
	//지점장 회원가입
	@GetMapping("/memberInsertEnterprise")
	public String memberInsertEnterprise() {
		return "member/memberInsertEnterprise";
	}
	@GetMapping("/memberInsertEnterprisePro")
	public String memberInsertEnterprisePro(EnterpriseVO enterpriseVO) {
		memberService.insertEnterprise(enterpriseVO);
		return "forward:/";
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
	public String memberDelete(HttpSession session, String password) {
		String id = (String) session.getAttribute("id");
		System.out.println(id);
		memberService.delete(id, password);		
		return "redirect:/";
	}
	
	//회원수정
	@GetMapping("/memberUpdateCheck")
	public String memberUpdateCheck(String id, Model model) {//
		MemberVO membervo = memberService.selectOne(id);
		model.addAttribute("memberVO", membervo);
		return "member/memberUpdateCheck";
	}
	@GetMapping("memberUpdateCheckPro")
	public String memberUpdateCheckPro(MemberVO membervo) {//
		memberService.Update(membervo);
		return "redirect:/memberSelect";
	}
}
