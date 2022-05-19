package kr.co.rrs.service;

import kr.co.rrs.vo.MemberVO;

public interface SessionService {
	//로그인 확인
	MemberVO loginCheck(String id);
}
