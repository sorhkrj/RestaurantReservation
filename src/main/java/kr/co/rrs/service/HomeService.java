package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

public interface HomeService {
	
	/* Service 사용법 */
	// 반환값 result(Value value);
	
	//로그인 확인
	Boolean loginCheck(String id, String password);
	
	//닉네임 할당
	String selectNickname(String id);
	
	//검색 결과 예약 페이지
	List<StoreVO> searchResultList(String search);
	
	List<ReviewVO> selectReview();
	
}
