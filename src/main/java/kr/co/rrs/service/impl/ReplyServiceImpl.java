package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ReplyMapper;
import kr.co.rrs.service.ReplyService;
import kr.co.rrs.vo.ReplyVO;
@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired
	ReplyMapper replyMapper;

	@Override
	public void insertReply(ReplyVO replyVO) {
		replyMapper.insertReply(replyVO);
	}

	@Override
	public void updateReply(ReplyVO replyVO) {
		replyMapper.updateReply(replyVO);
	}

	@Override
	public void deleteReply(ReplyVO replyVO) {
		replyMapper.deleteReply(replyVO);
	}


}
