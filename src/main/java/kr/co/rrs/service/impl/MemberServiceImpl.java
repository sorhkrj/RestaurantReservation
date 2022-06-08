package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.MemberMapper;
import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	private MemberMapper memberMapper;
	
	//회원가입
	@Override
	public void insert(MemberVO memberVO) {
		memberVO.setPassword(encoder.encode((memberVO.getPassword())));
		memberMapper.insert(memberVO);
	}
	//회원정보
	@Override
	public MemberVO selectOne(String id) {
		return memberMapper.selectOne(id);
	}
	//회원탈퇴
	@Override
	public Boolean delete(String id, String password) {
		String originalPw = memberMapper.selectOne(id).getPassword();
		if(encoder.matches(password, originalPw)) {
			memberMapper.delete(id);
			return true;	
		}else{
			return false;
		}
	}
	//회원수정
	@Override
	public void Update(MemberVO memberVO) {
		memberVO.setPassword(encoder.encode((memberVO.getPassword())));
		memberMapper.Update(memberVO);
	}
	//엔터프라이즈 회원가입
	@Override
	public void insertEnterprise(EnterpriseVO enterpriseVO) {
		enterpriseVO.setPassword(encoder.encode((enterpriseVO.getPassword())));
		memberMapper.insert2(enterpriseVO);
		memberMapper.insertEnterprise(enterpriseVO);
	}
	/* 박재호 */
	// 중복 아이디 확인
	@Override
	public Boolean memberIdCheck(String id) {
		if (id.isEmpty()) return false;
		Boolean result = (memberMapper.selectId(id) == null) ? true : false;
		return result;
	}
}
