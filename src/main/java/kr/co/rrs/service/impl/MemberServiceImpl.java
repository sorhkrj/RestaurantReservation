package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.MemberMapper;
import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insert(MemberVO memberVO) {
		memberMapper.insert(memberVO);
	}

	@Override
	public MemberVO selectOne(String id) {
		return memberMapper.selectOne(id);
	}
	@Override
	public void delete(MemberVO memberVO) {
		
		
	}


}
