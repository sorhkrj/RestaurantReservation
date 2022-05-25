package kr.co.rrs.service;

import org.apache.ibatis.annotations.Param;

import kr.co.rrs.vo.StoreVO;

public interface ReviewService {
	// 지점 번호 지점 정보 가져오기
	StoreVO selectOne(int storeNo);
	
	// 지점에 대한 좋아요 수
	int selectReivewLikeCnt(int storeNo);
}
