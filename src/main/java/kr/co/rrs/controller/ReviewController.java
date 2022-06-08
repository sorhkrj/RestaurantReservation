package kr.co.rrs.controller;

import java.io.File;
import java.security.Principal;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import kr.co.rrs.service.ReviewService;
import kr.co.rrs.vo.MenuVO;
import kr.co.rrs.vo.ReviewCommentVO;
import kr.co.rrs.vo.ReviewJoinMemberVO;
import kr.co.rrs.vo.ReviewLikeVO;
import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

@Controller
@RequestMapping("/review")
public class ReviewController {
	
	private final ReviewService reviewService;
	
	@Autowired
	public ReviewController(ReviewService reviewService) {
		this.reviewService = reviewService;
	}

	@RequestMapping("/storeDetailReviewMain")
	public String storeDetailReviewMain(StoreVO storeVO, ReviewLikeVO reviewLikeVO, ReviewCommentVO reviewCommentVO, Principal principal, Model model, HttpSession session) {
		storeVO = reviewService.selectOne(storeVO.getStoreNo()); // 지점 정보 검색
		
		// ----------------------------------------------------------------------좋아요 기능
		if(principal != null) {
			String id = principal.getName(); // 로그인 id 검색
			int likeStatus = reviewService.selectReviewLikeStatus(storeVO.getStoreNo(), id); // 내가 좋아요 했는지 안했는지 확인
			
			if(likeStatus == 1) {
				if(reviewLikeVO.getSw() == 1) {										// 좋아요 취소 누름
					reviewService.deleteReviewLike(storeVO.getStoreNo(), id);		// 좋아요 취소
				}
	
				likeStatus = reviewService.selectReviewLikeStatus(storeVO.getStoreNo(), id);
				reviewLikeVO.setLikeStatus(likeStatus);								// 내가 좋아요 취소 기억
			}
			else if (likeStatus == 0) {
				if(reviewLikeVO.getSw() == 2) {										// 좋아요 누름
					reviewService.insertReviewLike(storeVO.getStoreNo(), id);		// 좋아요 추가
				}
				
				likeStatus = reviewService.selectReviewLikeStatus(storeVO.getStoreNo(), id);
				reviewLikeVO.setLikeStatus(likeStatus);								// 내가 좋아요 추가 기억
			}
			
		}
		
		reviewLikeVO.setReviewLikeCnt(reviewService.selectReviewLikeCnt(storeVO.getStoreNo())); // 지점 좋아요 수
		// ----------------------------------------------------------------------좋아요 기능 끝

		// 지점 리뷰 전체 검색
		ArrayList<ReviewVO> reviewList = reviewService.selectReviewALL(storeVO.getStoreNo()); 
		ArrayList<ReviewJoinMemberVO> list2 = reviewService.selectReviewJoinMember(storeVO.getStoreNo());
		
		if(reviewList != null) { // 리뷰가 존재할경우에만 실행
			DecimalFormat decimalFormat = new DecimalFormat("0.00"); // 리뷰 평점 형식
			
			// 리뷰 평점 계산
			double avg = 0;
			for(int i=0; i<reviewList.size(); i++) {
				avg = avg + reviewList.get(i).getRating(); // 평점 전부 더하기
			}
			avg = avg/reviewList.size(); // 평균 구하기
			avg = Double.parseDouble(decimalFormat.format(avg)); // 소수점 0.00 까지
			if(Double.isNaN(avg)) { // 리뷰가 없을 경우 0으로 나눴을때 NaN 방지
				avg = 0;
			}
			
			model.addAttribute("avg", avg);
			// 리뷰 평점 계산 끝
			
			model.addAttribute("reviewListNick", list2); // member 조인 리스트(닉네임)
			model.addAttribute("reviewList", reviewList); // reviewVO 그대로의 리스트
		}
		// 지점 리뷰 전체 검색 끝
		
		// 리뷰 댓글 전체 검색
		ArrayList<ReviewCommentVO> reviewCommentList = reviewService.selectReviewCommentAll();
		if(reviewCommentList != null) {
			model.addAttribute("reviewCommentList", reviewCommentList);
		}
		// 리뷰 댓글 전체 검색 끝
		
		
		// 메뉴 전체 검색
		List<MenuVO> menuList= reviewService.selectMenu(storeVO.getStoreNo());
		model.addAttribute("menuList", menuList);
		model.addAttribute("storeVO", storeVO);
		model.addAttribute("reviewLikeVO", reviewLikeVO);
		
		return "review/storeDetailReviewMain";
	}
	
	@RequestMapping("/reviewInsertPro")
	public String reviewInsertPro(Principal principal, ReviewVO reviewVO, MultipartFile file, HttpServletRequest request) throws Exception {
		reviewVO.setId(principal.getName()); // 로그인 id 저장
		String path = "resources/images"; // 파일 저장하고 싶은 위치
		String savePath = request.getServletContext().getRealPath(path); // 실제 파일 저장 경로
		System.out.println(savePath); // 실제 파일 위치 찍어보기
		
		String filename = UUID.randomUUID() + file.getOriginalFilename(); 
		if(!file.isEmpty()) {
			System.out.println(filename); // 파일 실제 이름 찍어보기
			file.transferTo(new File(savePath, filename)); // 파일저장
			reviewVO.setReviewPhoto(filename); // db에 파일 이름 등록
		}
		else {
			reviewVO.setReviewPhoto("");
		}
		
		reviewService.insertReview(reviewVO); // 리뷰 등록
		
		return "redirect:storeDetailReviewMain?storeNo=" + reviewVO.getStoreNo();
	}
	
	@RequestMapping("/reviewDeletePro")
	public String reviewDeletePro(ReviewVO reviewVO) {
		reviewService.deleteReview(reviewVO.getStoreNo(), reviewVO.getReviewNo());
		return "redirect:storeDetailReviewMain?storeNo=" + reviewVO.getStoreNo();
	}
	
	@RequestMapping("/reviewCommentInsertPro")
	public String reviewCommentInsertPro(ReviewCommentVO reviewCommentVO, @RequestParam("storeNo") int storeNo, Principal principal) {
		System.out.println(reviewCommentVO.getReviewNo());
		System.out.println(reviewCommentVO.getReviewCommentContent());
		System.out.println(principal.getName());
		reviewCommentVO.setId(principal.getName());
		reviewService.insertReviewComment(reviewCommentVO);
		return "redirect:storeDetailReviewMain?storeNo=" + storeNo;
	}
	
	@RequestMapping("/reviewCommentDeletePro")
	public String reviewCommentDeletePro(ReviewCommentVO reviewCommentVO, @RequestParam("storeNo") int storeNo) {
		reviewService.deleteReviewComment(reviewCommentVO);
		return "redirect:storeDetailReviewMain?storeNo=" + storeNo;
	}
	
}
