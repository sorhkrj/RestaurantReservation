package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.ReplyService;
import kr.co.rrs.vo.ReplyVO;

@Controller
@RequestMapping("/serviceBoard")
public class ReplyController {
	private final ReplyService replyService;
	
	@Autowired
	public ReplyController(ReplyService replyService) {
		this.replyService = replyService;
	}

	@PostMapping("/replyInsertPro")
	public String replyInsertPro(ReplyVO replyVO) {
		replyService.insertReply(replyVO);
		
		return "redirect:serviceBoardDetail?serviceNo="+replyVO.getServiceNo();
	}
	
	@PostMapping("/replyUpdatePro")
	public String replyUpdatePro(ReplyVO replyVO) {
		replyService.updateReply(replyVO);
		
		return "redirect:serviceBoardDetail?serviceNo="+replyVO.getServiceNo();
	}
	
	@PostMapping("/replyDeletePro")
	public String replyDeletePro(ReplyVO replyVO) {
		replyService.deleteReply(replyVO);
		
		return "redirect:serviceBoardMain";
	}
}
