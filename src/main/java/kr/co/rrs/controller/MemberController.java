package kr.co.rrs.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

@Controller
@RequestMapping("/member")
@PropertySource("/resources/properties/cm.properties")
public class MemberController {

	@Value("${file.path}")
	private String filePath;

	private final MemberService memberService;

	@Autowired
	public MemberController(MemberService memberService) {
		this.memberService = memberService;
	}

	// 회원가입
	@GetMapping("/memberInsert")
	public String memberInsert() {
		return "member/memberInsert";
	}

	@GetMapping("/memberInsertPro")
	public String memberInsertPro(MemberVO memberVO) {
		memberService.insert(memberVO);
		return "forward:/";
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
	@GetMapping("/memberInsertEnterprise")
	public String memberInsertEnterprise() {
		return "member/memberInsertEnterprise";
	}

	@PostMapping("/memberInsertEnterprisePro")
	public String memberInsertEnterprisePro(EnterpriseVO enterpriseVO, @RequestParam("file") MultipartFile file)
			throws IOException {
		System.out.println(filePath);
		String uuid = UUID.randomUUID().toString() + file.getOriginalFilename();
		File converFile = new File(filePath, uuid);
		file.transferTo(converFile);
		enterpriseVO.setPhoto(uuid);
		memberService.insertEnterprise(enterpriseVO);
		return "redirect:/";
	}

	// 회원검색결과
	@GetMapping("/resultMember")
	public String resultMember() {
		return "member/resultMember";
	}

	// 지점검색결과
	@GetMapping("/resultStore")
	public String resultStore() {
		return "member/resultStore";
	}

	// 회원검색
	@GetMapping("/searchMember")
	public String seachMember() {
		return "member/searchMember";
	}

	// 지점검색
	@GetMapping("/searchStore")
	public String searchStore() {
		return "member/searchStore";
	}

	// 회원탈퇴
	@GetMapping("/memberDeleteCheck")
	public String memberDeleteCheck() {
		return "member/memberDeleteCheck";
	}

	@GetMapping("/memberDelete")
	public String memberDelete(Principal principal, String password) {
		String id = principal.getName();
		String result = memberService.delete(id, password);
		if (result.equals("a")) {
			return "redirect:/";
		} else {
			return "member/Deletecheckview";
		}
	}

	// 회원수정
	@GetMapping("/memberUpdateCheck")
	public String memberUpdateCheck(String id, Model model) {//
		MemberVO membervo = memberService.selectOne(id);
		model.addAttribute("memberVO", membervo);
		return "member/memberUpdateCheck";
	}

	@GetMapping("memberUpdateCheckPro")
	public String memberUpdateCheckPro(MemberVO membervo) {//
		memberService.Update(membervo);
		return "redirect:memberSelect";
	}
}
