package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface HomeService {
	//로그인 확인
	MemberVO loginCheck(String id);
	
	//검색 결과 예약 페이지
	List<StoreVO> searchResultList();
}
