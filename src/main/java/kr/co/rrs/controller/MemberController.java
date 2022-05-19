package kr.co.rrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
	public class MemberController {
		//회원가입
		@GetMapping("/memberInsert") 
		public String memberInsert() {
			return "member/memberInsert";
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
		//내정보
		@GetMapping("/memberSelect")
		public String memberSelect() {
			return "member/memberSelect";
		}
		//회원탈퇴
		@GetMapping("/memberDeleteCheck")
		public String memberDeleteCheck() {
			return "member/memberDeleteCheck";
		}
		//회원수정
		@GetMapping("/memberUpdateCheck")
		public String memberUpdateCheck() {
			return "member/memberUpdateCheck";
		}

	}