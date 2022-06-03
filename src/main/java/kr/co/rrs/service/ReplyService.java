package kr.co.rrs.service;

import kr.co.rrs.vo.ReplyVO;

public interface ReplyService {
	void insertReply(ReplyVO replyVO);
	
	void updateReply(ReplyVO replyVO);
	
	void deleteReply(ReplyVO replyVO);
}
