package kr.co.rrs.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import kr.co.rrs.vo.ServiceBoardVO;

public interface ServiceBoardService {
	// 문의글 전체 목록 보기
	List<ServiceBoardVO> selectList();
	
	// 문의글 등록하기
	void insert(ServiceBoardVO serviceBoardVO);
	
	// 문의글 상세보기
	ServiceBoardVO selectDetail(int serviceNo);
	
	// 조회수 업데이트
	void updateViews(@Param("views") int views, @Param("serviceNo") int serviceNo);
	
}
