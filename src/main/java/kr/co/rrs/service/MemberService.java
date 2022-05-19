package kr.co.rrs.service;

import kr.co.rrs.vo.MemberVO;

public interface MemberService {
	void insert(MemberVO memberVO);
	MemberVO selectOne(String id);
	
}
