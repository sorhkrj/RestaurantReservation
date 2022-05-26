package kr.co.rrs.service;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

public interface ReviewService {
	// 지점 번호 지점 정보 가져오기
	StoreVO selectOne(int storeNo);
	
	// 지점에 대한 좋아요 수
	int selectReviewLikeCnt(int storeNo);
	
	// 로그인 id에 대한 좋아요 체크
	int selectReviewLikeStatus(int storeNo, String id);
	
	// 좋아요 누름 insert
	void insertReviewLike(int storeNo, String id);
	
	// 좋아요 취소 delete
	@Delete("delete from reviewLike where id = #{id}")
	void deleteReviewLike(int storeNo, String id);
	
	// 리뷰 insert
	void insertReview(ReviewVO reviewVO);
}
