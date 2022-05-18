package kr.co.rrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceBoardController {
	
	@GetMapping("/serviceBoardMain")
	public String serviceBoardMain() {
		return "serviceBoard/serviceBoardMain";
	}
	
	@PostMapping("/serviceBoardInsert")
	public String serviceBoardInsert() {
		return "serviceBoard/serviceBoardInsert";
	}
	
	@PostMapping("/serviceBoardInsertPro")
	public String serviceBoardInsertPro() {
		return "serviceBoard/serviceBoardMain";
	}
	
	@GetMapping("/serviceBoardDetail")
	public String serviceBoardDetail() {
		return "serviceBoard/serviceBoardDetail";
	}
}
