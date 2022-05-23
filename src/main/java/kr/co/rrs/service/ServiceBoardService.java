package kr.co.rrs.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;

public interface ServiceBoardService {
	// 문의글 전체 목록 보기
	List<ServiceBoardVO> selectList();
	
	// 문의글 등록하기
	void insert(ServiceBoardVO serviceBoardVO, HttpSession session);
	
	// 문의글 상세보기
	ServiceBoardVO selectDetail(int serviceNo);
	
	// 문의글 번호에 해당하는 답변 불러오기
	ReplyVO selectReply(int serviceNo);
	
	// 조회수 업데이트
	void updateViews(int serviceNo, String id);
	
	// 문의글 수정
	void update(int serviceNo, String title, String content);
	
	// 문의글 삭제
	void delete(int serviceNo);
	
	// 문의글 전체 개수
	int selectServiceBoardTotal();
}
