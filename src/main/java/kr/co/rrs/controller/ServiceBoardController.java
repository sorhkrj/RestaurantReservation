package kr.co.rrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ServiceBoardController {
	
	// 고객센터 목록 리스트
	@RequestMapping(value =  "/serviceBoardMain", method = {RequestMethod.GET, RequestMethod.POST})
	public String serviceBoardMain() {
		return "serviceBoard/serviceBoardMain";
	}

	// 글 쓰기
	@PostMapping("/serviceBoardInsert")
	public String serviceBoardInsert() {
		return "serviceBoard/serviceBoardInsert";
	}

	// 글 쓰기 처리
	@PostMapping("/serviceBoardInsertPro")
	public String serviceBoardInsertPro() {
		return "redirect:/serviceBoardMain";
	}

	// 글 상세 보기
	@GetMapping("/serviceBoardDetail")
	public String serviceBoardDetail() {
		return "serviceBoard/serviceBoardDetail";
	}

	// 글 수정 비밀번호 확인
	@PostMapping("/serviceBoardUpdateCheck")
	public String serviceBoardUpdateCheck() {
		return "serviceBoard/serviceBoardUpdateCheck";
	}
		
	// 글 수정 내용 입력
	@PostMapping("/serviceBoardUpdate")
	public String serviceBoardUpdate() {
		return "serviceBoard/serviceBoardUpdate";
	}
	
	// 글 수정 처리
	@PostMapping("/serviceBoardUpdatePro")
	public String serviceBoardUpdatePro() {
		return "serviceBoard/serviceBoardDetail";
	}
	
	// 글 삭제 비밀번호 확인
	@PostMapping("/serviceBoardDeleteCheck")
	public String serviceBoardDeleteCheck() {
		return "serviceBoard/serviceBoardDeleteCheck";
	}
	
	// 글 삭제 처리
	@PostMapping("/serviceBoardDeletePro")
	public String serviceBoardDeletePro() {
		return "redirect:/serviceBoardMain";
	}
}
