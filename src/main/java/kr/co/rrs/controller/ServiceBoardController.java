package kr.co.rrs.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.service.ServiceBoardService;
import kr.co.rrs.vo.ServiceBoardVO;

@Controller
public class ServiceBoardController {
	@Autowired
	ServiceBoardService serviceBoardService;
	
	// 고객센터 목록 리스트
	@GetMapping("/serviceBoardMain")
	public String serviceBoardMain(Model model) {
		List<ServiceBoardVO> list = serviceBoardService.selectList();
		model.addAttribute("selectList", list);
		
		return "serviceBoard/serviceBoardMain";
	}

	// 글 쓰기
	@GetMapping("/serviceBoardInsert")
	public String serviceBoardInsert(ServiceBoardVO serviceBoardVO) {
		return "serviceBoard/serviceBoardInsert";
	}

	// 글 쓰기 처리
	@PostMapping("/serviceBoardInsertPro")
	public String serviceBoardInsertPro(ServiceBoardVO serviceBoardVO) {
		serviceBoardService.insert(serviceBoardVO);
		
		return "redirect:/serviceBoardMain";
	}

	// 글 상세 보기
	@GetMapping("/serviceBoardDetail")
	public String serviceBoardDetail(HttpServletRequest request) {
		// Detail jsp 에서 문의글 번호 받아오기
		int serviceNo = Integer.parseInt(request.getParameter("serviceNo"));
		
		// Detail jsp 에서 문의글 번호 받아오기
		int views = Integer.parseInt(request.getParameter("views"));
		
		// 상세보기할때 조회수 증가하기
		serviceBoardService.updateViews(views, serviceNo);
		
		// 문의글 상세 보기 서비스 실행
		ServiceBoardVO serviceBoardVO = serviceBoardService.selectDetail(serviceNo);
		
		// Detail jsp에서 데이터 표시를 위한 코드
		request.setAttribute("selectDetail", serviceBoardVO);
			
		return "serviceBoard/serviceBoardDetail";
	}

	// 글 수정 비밀번호 확인
	@GetMapping("/serviceBoardUpdateCheck")
	public String serviceBoardUpdateCheck(@RequestParam("serviceNo") int serviceNo, @RequestParam("id") String id, Model model) {
		model.addAttribute("serviceNo", serviceNo);
		model.addAttribute("id", id);
		
		// 디테일에서 아이디, 문의글 번호 받고, 로그인 한 session id 를 받아서 
		// 문의글 작성자 id 와 비교후 같은 아이디일 경우 password까지 체크 하고 맞으면 업데이트로 넘기고
		// 아이디 다르면 문의글 작성자만 수정 할 수 있다고 경고 띄우고
		
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
