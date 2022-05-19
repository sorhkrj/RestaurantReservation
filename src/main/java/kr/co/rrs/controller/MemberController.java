package kr.co.rrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
	public class MemberController {
		//ȸ������
		@GetMapping("/memberInsert") 
		public String memberInsert() {
			return "member/memberInsert";
		}
		//������ ȸ������
		@GetMapping("/memberInsertEnterprise")
		public String memberInsertEnterprise() {
			return "member/memberInsertEnterprise";
		}
		//ȸ���˻����
		@GetMapping("/resultMember")
		public String resultMember() {
			return "member/resultMember";
		}
		//�����˻����
		@GetMapping("/resultStore")
		public String resultStore() {
			return "member/resultStore";
		}
		//ȸ���˻�
		@GetMapping("/searchMember")
		public String seachMember() {
			return "member/searchMember";
		}
		//�����˻�
		@GetMapping("/searchStore")
		public String searchStore() {
			return "member/searchStore";
		}
		//������
		@GetMapping("/memberSelect")
		public String memberSelect() {
			return "member/memberSelect";
		}
		//ȸ��Ż��
		@GetMapping("/memberDeleteCheck")
		public String memberDeleteCheck() {
			return "member/memberDeleteCheck";
		}
		//ȸ������
		@GetMapping("/memberUpdateCheck")
		public String memberUpdateCheck() {
			return "member/memberUpdateCheck";
		}

	}