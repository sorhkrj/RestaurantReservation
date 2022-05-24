package kr.co.rrs.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.mapper.HomeMapper;
import kr.co.rrs.mapper.MemberMapper;
import kr.co.rrs.service.HomeService;
import kr.co.rrs.service.ServiceBoardService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;

@Controller
public class ServiceBoardController {
	@Autowired
	ServiceBoardService serviceBoardService;
	@Autowired
	HomeService homeService;
	
	// 고객센터 목록 리스트
	@GetMapping("/serviceBoardMain")
	public String serviceBoardMain(ServiceBoardVO serviceBoardVO, Model model, HttpSession session, HttpServletResponse response) {
		// 전체 문의글 개수
		int total = serviceBoardService.selectServiceBoardTotal();
		serviceBoardVO.setTotal(total);
		// 전체 필요한 페이지
		int totalPage = (int) Math.ceil((double)total/10);
		// 현재 페이지
		int nowPage = serviceBoardVO.getNowPage();
		// previous btn interlock - page = cPage-10
		if(nowPage < 1){
			nowPage = 1; 
		}
		// next btn interlock - page = cPage+10
		if(nowPage > totalPage && totalPage != 0){
			nowPage = totalPage;
		}
		// 페이지 개수 계산
		int index = nowPage % 10 == 0 ? nowPage/10 : nowPage/10 + 1; // 페이지의 번호 확인 후 밑에 보여질 페이지 숫자를 결정
		int startPage = 1 + ((index-1) * 10); // 페이지 10개씩
		int endPage = startPage + 9;
		// endPage interlock 전체 페이지가 끝 페이지보다 작을 경우
		if(endPage > totalPage){
			endPage = totalPage;
		}
		// nowPage로 게시물 계산
		int startBoard = 1 + ((nowPage-1)*10); // 목록 10개씩
		int endBoard = startBoard + 9;

		System.out.println(total);
		System.out.println(totalPage);
		System.out.println(nowPage);
		System.out.println(index);
		System.out.println(startPage);
		System.out.println(endPage);
		System.out.println(startBoard);
		System.out.println(endBoard);
		
		String id = (String) session.getAttribute("id");
		
		if(id == null) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('로그인 해주세요.'); </script>");
			out.flush();
			return "login";
		}
		
		List<ServiceBoardVO> list = serviceBoardService.selectList(startBoard, endBoard);
		List<ReplyVO> list2 = null;
		if(list != null) {
			list2 = new ArrayList<ReplyVO>();
			for(int i=0; i<list.size(); i++) {
				list2.add(serviceBoardService.selectReply(list.get(i).getServiceNo()));
			}
		}
		
		model.addAttribute("selectList", list);
		model.addAttribute("replyList", list2);
		model.addAttribute("total", total);
		model.addAttribute("totalPage", totalPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		
		return "serviceBoard/serviceBoardMain";
	}

	// 글 쓰기
	@GetMapping("/serviceBoardInsert")
	public String serviceBoardInsert(ServiceBoardVO serviceBoardVO) {
		return "serviceBoard/serviceBoardInsert";
	}

	// 글 쓰기 처리
	@PostMapping("/serviceBoardInsertPro")
	public String serviceBoardInsertPro(ServiceBoardVO serviceBoardVO, HttpSession session) {
		serviceBoardService.insert(serviceBoardVO, session);
		
		return "redirect:/serviceBoardMain";
	}

	// 글 상세 보기
	@RequestMapping(value = "/serviceBoardDetail", method = {RequestMethod.GET, RequestMethod.POST})
	public String serviceBoardDetail(@RequestParam("serviceNo") int serviceNo, HttpSession session, Model model) {
		// 상세보기할때 조회수 증가하기
		String id = (String) session.getAttribute("id");
		MemberVO memberVO = homeService.loginCheck(id);

		serviceBoardService.updateViews(serviceNo, id);
				
		// 문의글 상세 보기 서비스 실행
		ServiceBoardVO serviceBoardVO = serviceBoardService.selectDetail(serviceNo);
		ReplyVO replyVO = serviceBoardService.selectReply(serviceNo);
		
		// Detail jsp에서 데이터 표시를 위한 코드
		model.addAttribute("serviceBoardVO", serviceBoardVO);
		model.addAttribute("replyVO", replyVO);
		model.addAttribute("memberVO", memberVO);
			
		return "serviceBoard/serviceBoardDetail";
	}

	// 글 수정 비밀번호 확인
	@RequestMapping(value = "/serviceBoardUpdateCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String serviceBoardUpdateCheck(ServiceBoardVO serviceBoardVO, HttpSession session, HttpServletResponse response, Model model) {
		serviceBoardVO = serviceBoardService.selectDetail(serviceBoardVO.getServiceNo());
		String id = (String) session.getAttribute("id");
		
		if(!serviceBoardVO.getId().equals(id)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('본인의 글만 수정할 수 있습니다.'); </script>");
			out.flush();
			
			return "forward:/serviceBoardDetail?serviceNo="+serviceBoardVO.getServiceNo();
		}
		model.addAttribute("serviceNo", serviceBoardVO.getServiceNo());
		
		// 디테일에서 아이디, 문의글 번호 받고, 로그인 한 session id 를 받아서 
		// 문의글 작성자 id 와 비교후 같은 아이디일 경우 password까지 체크 하고 맞으면 업데이트로 넘기고
		// 아이디 다르면 문의글 작성자만 수정 할 수 있다고 경고 띄우고
		
		return "serviceBoard/serviceBoardUpdateCheck";
	}
		
	// 글 수정 내용 입력
	@PostMapping("/serviceBoardUpdate")
	public String serviceBoardUpdate(ServiceBoardVO serviceBoardVO, @RequestParam("password") String password, HttpServletResponse response, Model model) {
		serviceBoardVO = serviceBoardService.selectDetail(serviceBoardVO.getServiceNo());
		MemberVO memberVO = homeService.loginCheck(serviceBoardVO.getId());
		if(password.equals(memberVO.getPassword())) { // 문의글 번호에 대한 아이디로 회원 정보 검색 후 패스워드 비교하여 패스워드가 같을때
			System.out.println(serviceBoardVO.getServiceNo());
			System.out.println(serviceBoardVO.getTitle());
			System.out.println(serviceBoardVO.getContent());
			model.addAttribute("serviceBoardVO", serviceBoardVO);
			return "serviceBoard/serviceBoardUpdate";
		}
		else { // 패스워드가 틀릴 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('비밀번호가 틀립니다. 수정할 수 없습니다.'); </script>");
			out.flush();
			
			return "forward:/serviceBoardUpdateCheck?serviceNo=" + serviceBoardVO.getServiceNo();
		}
		
	}
	
	// 글 수정 처리
	@PostMapping("/serviceBoardUpdatePro")
	public String serviceBoardUpdatePro(@Param("serviceNo") int serviceNo, ServiceBoardVO serviceBoardVO) {
		serviceBoardService.update(serviceNo, serviceBoardVO.getTitle(), serviceBoardVO.getContent());
		
		return "redirect:/serviceBoardDetail?serviceNo=" + serviceNo;
	}
	
	// 글 삭제 비밀번호 확인
	@RequestMapping(value = "/serviceBoardDeleteCheck", method = {RequestMethod.GET, RequestMethod.POST})
	public String serviceBoardDeleteCheck(HttpServletResponse response, HttpSession session, @Param("serviceNo") int serviceNo, Model model) {
		ServiceBoardVO serviceBoardVO = serviceBoardService.selectDetail(serviceNo);
		String id = (String) session.getAttribute("id");
		
		if(!serviceBoardVO.getId().equals(id)) {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('본인의 글만 삭제할 수 있습니다.'); </script>");
			out.flush();
			
			return "forward:/serviceBoardDetail?serviceNo="+serviceNo;
		}
		
		model.addAttribute("serviceBoardVO", serviceBoardVO);
		
		return "serviceBoard/serviceBoardDeleteCheck";
	}
	
	// 글 삭제 처리
	@PostMapping("/serviceBoardDeletePro")
	public String serviceBoardDeletePro(@Param("serviceNo") int serviceNo, @Param("password") String password, HttpServletResponse response) {
		ServiceBoardVO serviceBoardVO = serviceBoardService.selectDetail(serviceNo);
		MemberVO memberVO = homeService.loginCheck(serviceBoardVO.getId());
		
		if(password.equals(memberVO.getPassword())) { // 문의글 번호에 대한 아이디로 회원 정보 검색 후 패스워드 비교하여 패스워드가 같을때
			serviceBoardService.delete(serviceNo);
			
			return "redirect:/serviceBoardMain";
		}
		else { // 패스워드가 틀릴 경우
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('비밀번호가 틀립니다. 삭제할 수 없습니다.'); </script>");
			out.flush();
			
			return "forward:/serviceBoardDeleteCheck?serviceNo=" + serviceNo;
		}
	}
	
}
