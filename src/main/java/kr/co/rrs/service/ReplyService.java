package kr.co.rrs.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;

public interface ReplyService {
	void insertReply(ReplyVO replyVO);
	
	void updateReply(ReplyVO replyVO);
	
	void deleteReply(ReplyVO replyVO);
}
