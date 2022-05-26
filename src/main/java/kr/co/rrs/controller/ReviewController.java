package kr.co.rrs.controller;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.ReviewService;
import kr.co.rrs.vo.ReviewLikeVO;
import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/like")
	public String like(ReviewLikeVO likeVO) {
		
		return "forward:/storeDetailReviewMain";
	}
	
	@RequestMapping("/storeDetailReviewMain")
	public String storeDetailReviewMain(StoreVO storeVO, ReviewLikeVO reviewLikeVO, Model model, HttpSession session) {
		storeVO = reviewService.selectOne(storeVO.getStoreNo()); // 지점 정보 검색
		String id = (String) session.getAttribute("id"); // 로그인 id 검색
		
		if(id != null) {
			int likeStatus = reviewService.selectReviewLikeStatus(storeVO.getStoreNo(), id); // 내가 좋아요 했는지 안했는지 확인
			
			if(likeStatus == 1) {
				System.out.println(storeVO.getStoreNo());
				System.out.println(id);
				System.out.println(reviewLikeVO.getSw());
				if(reviewLikeVO.getSw() == 1) {										// 좋아요 취소 누름
					reviewService.deleteReviewLike(storeVO.getStoreNo(), id);		// 좋아요 취소
				}
	
				likeStatus = reviewService.selectReviewLikeStatus(storeVO.getStoreNo(), id);
				reviewLikeVO.setLikeStatus(likeStatus);								// 내가 좋아요 취소 기억
				System.out.println("-----------------------삭제 완료------------------------");
			}
			else if (likeStatus == 0) {
				System.out.println(storeVO.getStoreNo());
				System.out.println(id);
				System.out.println(reviewLikeVO.getSw());
				if(reviewLikeVO.getSw() == 2) {										// 좋아요 누름
					reviewService.insertReviewLike(storeVO.getStoreNo(), id);		// 좋아요 추가
				}
				
				likeStatus = reviewService.selectReviewLikeStatus(storeVO.getStoreNo(), id);
				reviewLikeVO.setLikeStatus(likeStatus);								// 내가 좋아요 추가 기억
				System.out.println("-----------------------삽입 완료-------------------------");
			}
			
		}
		
		reviewLikeVO.setReviewLikeCnt(reviewService.selectReviewLikeCnt(storeVO.getStoreNo())); // 지점 좋아요 수
		
		model.addAttribute("storeVO", storeVO);
		model.addAttribute("reviewLikeVO", reviewLikeVO);
		
		return "review/storeDetailReviewMain";
	}
	
	@RequestMapping("/reviewInsertPro")
	public String reviewInsertPro(ReviewVO reviewVO) {
		reviewService.insertReview(reviewVO);
		
		return "redirect:/storeDetailReviewMain?storeNo=" + reviewVO.getStoreNo();
	}
}
