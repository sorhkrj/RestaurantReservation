package kr.co.rrs.service;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;

import kr.co.rrs.vo.MenuVO;
import kr.co.rrs.vo.ReviewCommentVO;
import kr.co.rrs.vo.ReviewJoinMemberVO;
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
	
	// 리뷰 전체 검색
	ArrayList<ReviewVO> selectReviewALL(int storeNo);
	
	// 리뷰 조인 검색
	ArrayList<ReviewJoinMemberVO> selectReviewJoinMember(int storeNo);
	
	// 리뷰 삭제
	@Delete("delete from review where storeNo = #{storeNo} and reviewNo = #{reviewNo}")
	void deleteReview(int storeNo, int reviewNo);
	
	// 리뷰 댓글 전체 검색
	ArrayList<ReviewCommentVO> selectReviewCommentAll();
	
	// 리뷰 댓글 삽입
	void insertReviewComment(ReviewCommentVO reviewCommentVO);
	
	// 리뷰 댓글 삭제
	void deleteReviewComment(ReviewCommentVO reviewCommentVO);

	// 메뉴 리스트 검색
	List<MenuVO> selectMenu(int storeNo);
}
