package kr.co.rrs.controller;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.ReviewService;
import kr.co.rrs.vo.ReviewLikeVO;
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
	public String storeDetailReviewMain(StoreVO storeVO, ReviewLikeVO reviewLikeVO, Model model, @Param("id") String id) {
		storeVO = reviewService.selectOne(storeVO.getStoreNo()); // 지점 정보 검색
		int reviewLikeCnt = reviewService.selectReivewLikeCnt(storeVO.getStoreNo()); // 지점 좋아요 수
		
		if(reviewLikeVO.getSw() == 0) {  										// 좋아요 버튼 꺼짐 상태
			System.out.println(reviewLikeVO.getSw()); 							// 0
			System.out.println(id);
			System.out.println(storeVO.getStoreNo());
			System.out.println("---------------------------------------------------");
		}
		else {																	// 좋아요 버튼 켜짐 상태
			System.out.println(reviewLikeVO.getSw()); 							// 1
			System.out.println(id);
			System.out.println(storeVO.getStoreNo());
			System.out.println("---------------------------------------------------");
		}
		
		model.addAttribute("storeVO", storeVO);
		model.addAttribute("reviewLikeCnt", reviewLikeCnt);
		model.addAttribute("reviewLikeVO", reviewLikeVO);
		
		return "review/storeDetailReviewMain";
	}
}
