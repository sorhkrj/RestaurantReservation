package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.ReviewService;
import kr.co.rrs.vo.LikeVO;

@Controller
public class ReviewController {
	@Autowired
	ReviewService reviewService;
	
	@RequestMapping("/like")
	public String like(LikeVO likeVO) {
		
		return "forward:/storeDetailReviewMain";
	}
	
	@RequestMapping("/storeDetailReviewMain")
	public String storeDetailReviewMain(LikeVO likeVO, Model model) {
		model.addAttribute("likeVO", likeVO);
		
		return "review/storeDetailReviewMain";
	}
}
