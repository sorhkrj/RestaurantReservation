package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ReviewMapper;
import kr.co.rrs.service.ReviewService;
import kr.co.rrs.vo.StoreVO;
@Service
public class ReviewServiceImpl implements ReviewService {
	@Autowired
	ReviewMapper reviewMapper;
	
	// 지점 번호 지점 정보 가져오기
	@Override
	public StoreVO selectOne(int storeNo) {

		return reviewMapper.selectOne(storeNo);
	}
	
	// 지점에 대한 좋아요 수
	@Override
	public int selectReivewLikeCnt(int storeNo) {
		return reviewMapper.selectReivewLikeCnt(storeNo);
	}
	
}
