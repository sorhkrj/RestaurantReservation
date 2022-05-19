package kr.co.rss.service;

import java.util.List;

import kr.co.rss.VO.ServiceBoardVO;

public interface ServiceBoardService {
	// 문의글 전체 목록 보기
	List<ServiceBoardVO> selectList();
	
	// 문의글 등록하기
	void insert(ServiceBoardVO serviceBoardVO);
	
}
