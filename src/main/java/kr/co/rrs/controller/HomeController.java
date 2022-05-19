package kr.co.rrs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.rrs.service.LogService;
import kr.co.rss.VO.MemberVO;


@Controller
public class HomeController {

	@Autowired
	private LogService logService;
	
	@GetMapping("/")
	public String home() {
		return "index";
	}
	
	@GetMapping("/login")
	public String login() {
		List<MemberVO> memberList = logService.select("id");
		System.out.println(memberList.toString());
		return "login";
	}
	
	@GetMapping("/searchResult")
	public String searchResult() {
		return "searchResult";
	}
}
