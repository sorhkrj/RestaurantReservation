package kr.co.rrs.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

@Controller
@RequestMapping("/member")
public class MemberController {

	private final MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}
	
	// 회원가입
	@GetMapping("/signup/memberInsert")
	public String memberInsert() {
		return "member/signup/memberInsert";
	}

	@PostMapping("/signup/memberInsertPro")
	public String memberInsertPro(MemberVO memberVO) {
		memberService.insert(memberVO);
		return "redirect:/";
	}

	// 내정보
	@GetMapping("/memberSelect")
	public String memberSelect(Model model, Principal principal) {
		String id = principal.getName();
		MemberVO memberVO = memberService.selectOne(id);
		model.addAttribute("memberVO", memberVO);
		return "member/memberSelect";
	}

	// 지점장 회원가입
	@GetMapping("/signup/memberInsertEnterprise")
	public String memberInsertEnterprise() {
		return "member/signup/memberInsertEnterprise";
	}

	@PostMapping("/signup/memberInsertEnterprisePro")
	public String memberInsertEnterprisePro(EnterpriseVO enterpriseVO, @RequestParam("file") MultipartFile file, HttpServletRequest request)
			throws IOException {
		String path = "resources/images"; // 파일 저장하고 싶은 위치
		String savePath = request.getServletContext().getRealPath(path); // 실제 파일 저장 경로
		System.out.println(savePath);
		
		String uuid = UUID.randomUUID().toString() + file.getOriginalFilename();
		File converFile = new File(savePath, uuid);
		file.transferTo(converFile);
		enterpriseVO.setPhoto(uuid);
		memberService.insertEnterprise(enterpriseVO);
		return "redirect:/";
	}

	// 회원탈퇴
	@GetMapping("/memberDeleteCheck")
	public String memberDeleteCheck() {
		return "member/memberDeleteCheck";
	}

	@PostMapping("/memberDelete")
	public String memberDelete(Principal principal, String password, HttpServletResponse response) {
		String id = principal.getName();
		Boolean result = memberService.delete(id, password, response);
		if (result) {
			return "redirect:/logout";
		} else {
			return "member/memberDeleteCheck";
		}
	}

	// 회원 체크
	@GetMapping("/memberUpdateCheck")
	public String memberUpdateCheck(String id, Model model) {//
		MemberVO membervo = memberService.selectOne(id);
		model.addAttribute("memberVO", membervo);
		return "member/memberUpdateCheck";
	}
	
	// 회원 수정
	@PostMapping("/memberUpdate")
	public String memberUpdate(String id, String password, Model model, HttpServletResponse response) {//
		MemberVO membervo = memberService.selectOne(id);
		
		// true 비밀번호 OK, false 비밀번호 NG
		boolean result = memberService.updateCheck(membervo, password, response);
		if(result) {
			model.addAttribute("memberVO", membervo);
			return "member/memberUpdate";
		}
		else {
			model.addAttribute("memberVO", membervo);
			return "member/memberUpdateCheck";
		}
	}

	@GetMapping("memberUpdateCheckPro")
	public String memberUpdateCheckPro(MemberVO membervo) {//
		memberService.Update(membervo);
		return "redirect:memberSelect";
	}
	
	@GetMapping("/signup/memberIdCheck")
	@ResponseBody
	public Boolean memberIdCheck(String id) {
		Boolean result = memberService.memberIdCheck(id);
		return result;
	}
}
