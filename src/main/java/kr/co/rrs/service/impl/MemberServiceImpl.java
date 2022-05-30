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

	@Override
	public void insert(MemberVO memberVO) {
		memberVO.setPassword(encoder.encode((memberVO.getPassword())));
		memberMapper.insert(memberVO);
	}

	@Override
	public MemberVO selectOne(String id) {
		return memberMapper.selectOne(id);
	}
	@Override
	public void delete(String id, String password) {
		System.out.println("service : "+id);
		memberMapper.delete(id, password);
		
		
	}
	@Override
	public void Update(MemberVO memberVO) {
		memberMapper.Update(memberVO);
		
	}

	@Override
	public void insertEnterprise(EnterpriseVO enterpriseVO) {
		enterpriseVO.setPassword(encoder.encode((enterpriseVO.getPassword())));
		memberMapper.insert2(enterpriseVO);
		memberMapper.insertEnterprise(enterpriseVO);
	}


}
