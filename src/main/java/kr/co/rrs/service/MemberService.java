package kr.co.rrs.service;

import javax.servlet.http.HttpServletResponse;

import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

public interface MemberService {
	//회원가입
	void insert(MemberVO memberVO);
	//내정보 조회
	MemberVO selectOne(String id);
	//회원탈퇴
	Boolean delete(String id, String password, HttpServletResponse response);
	//회원수정
	void Update(MemberVO memberVO);
	//엔터프라이즈 가입
	void insertEnterprise(EnterpriseVO enterpriseVO);
	/* 박재호 */
	//중복 아이디 확인
	Boolean memberIdCheck(String id);
	
	//수정 전 패스워드 확인
	boolean updateCheck(MemberVO membervo, String password, HttpServletResponse response);
}
