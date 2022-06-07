package kr.co.rrs.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ReviewMapper;
import kr.co.rrs.service.ReviewService;
import kr.co.rrs.vo.MenuVO;
import kr.co.rrs.vo.ReviewCommentVO;
import kr.co.rrs.vo.ReviewJoinMemberVO;
import kr.co.rrs.vo.ReviewVO;
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
	public int selectReviewLikeCnt(int storeNo) {
		return reviewMapper.selectReviewLikeCnt(storeNo);
	}

	// 로그인 id에 대한 좋아요 체크
	@Override
	public int selectReviewLikeStatus(int storeNo, String id) {
		return reviewMapper.selectReviewLikeStatus(storeNo, id);
	}

	// 좋아요 누름 insert
	@Override
	public void insertReviewLike(int storeNo, String id) {
		reviewMapper.insertReviewLike(storeNo, id);
	}

	// 좋아요 취소 delete
	@Override
	public void deleteReviewLike(int storeNo, String id) {
		reviewMapper.deleteReviewLike(storeNo, id);
	}

	// 리뷰 insert
	@Override
	public void insertReview(ReviewVO reviewVO) {
		reviewMapper.insertReview(reviewVO);
	}

	// 리뷰 전체 검색
	@Override
	public ArrayList<ReviewVO> selectReviewALL(int storeNo) {
		return reviewMapper.selectReviewALL(storeNo);
	}

	// 리뷰 조인 검색
	@Override
	public ArrayList<ReviewJoinMemberVO> selectReviewJoinMember(int storeNo) {
		return reviewMapper.selectReviewJoinMember(storeNo);
	}

	// 리뷰 삭제
	@Override
	public void deleteReview(int storeNo, int reviewNo) {
		reviewMapper.deleteReview(storeNo, reviewNo);
	}

	// 리뷰 댓글 전체 검색
	@Override
	public ArrayList<ReviewCommentVO> selectReviewCommentAll() {
		return reviewMapper.selectReviewCommentAll();
	}
		
	// 리뷰 댓글 삽입
	@Override
	public void insertReviewComment(ReviewCommentVO reviewCommentVO) {
		reviewMapper.insertReviewComment(reviewCommentVO);
	}

	// 리뷰 댓글 삭제
	@Override
	public void deleteReviewComment(ReviewCommentVO reviewCommentVO) {
		reviewMapper.deleteReviewComment(reviewCommentVO);
	}
	
	//
	
	public List<MenuVO> selectMenu(int storeNo){
		List<MenuVO> lmvo = reviewMapper.selectMenu(storeNo);
		return lmvo;
	}
	

	
}
