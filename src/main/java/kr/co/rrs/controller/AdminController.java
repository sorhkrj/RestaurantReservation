package kr.co.rrs.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.AdminService;
import kr.co.rrs.vo.MemberVO;

@Controller
@RequestMapping("/admin")
public class AdminController {

	private final AdminService service; // Service

	@Autowired
	public AdminController(AdminService service) {
		this.service = service;
	}
	
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

	@GetMapping("/memberAdmin")
	public String getMemberInfo(String id, Model model) {
		MemberVO mvo = service.getMember(id);
		System.out.println(mvo.getEnabled());
		model.addAttribute("memberVO", mvo);
		return "admin/memberAdmin";
	}

	@GetMapping("/storeAdmin")
	public String getStoreInfo(int storeNo, Model model) {
		model.addAttribute("storeVO", service.getStore(storeNo));
		return "admin/storeAdmin";
	}
	
	@PostMapping("/memberRecoveryAdmin")
	public String memberRecoveryAdmin(HttpServletResponse response, String id) {
		
		if(service.memberRecoveryAdmin(id)) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter out = null;
				try {
					out = response.getWriter();
				} catch (IOException e) {
					e.printStackTrace();
				}
				out.println("<script>alert('계정이 복구되었습니다.'); </script>");
				out.flush();
				return "forward:/";
		}else{
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('복구가 실패하였습니다.'); </script>");
			out.flush();
			return "";
		}

	}

}
