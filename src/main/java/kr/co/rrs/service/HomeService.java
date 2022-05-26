package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface HomeService {
	
	/* Service 사용법 */
	// 반환값 result(Value value);
	
	//로그인 확인
	MemberVO loginCheck(String id, String password);
	
	//검색 결과 예약 페이지
	List<StoreVO> searchResultList(String search);
}
