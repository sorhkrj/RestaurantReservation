package kr.co.rrs.service;

import kr.co.rrs.vo.MemberVO;

public interface MemberService {
	//회원가입
	void insert(MemberVO memberVO);
	//내정보 조회
	MemberVO selectOne(String id);
	//회원탈퇴
	void delete(MemberVO memberVO);
	//회원수정
	void Update(MemberVO memberVO);
}
