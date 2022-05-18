package kr.co.rrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
	public class MemberController {
		
		@GetMapping("/memberInsert") 
		public String memberInsert() {
			return "member/memberInsert";
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



	}

	
	


