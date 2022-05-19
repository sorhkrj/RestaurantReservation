package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.SessionMapper;
import kr.co.rrs.service.SessionService;
import kr.co.rrs.vo.MemberVO;

@Service
public class SessionServiceImpl implements SessionService {
	@Autowired
	SessionMapper sessionMapper;
	
	@Override
	public MemberVO loginCheck(String id) {
		MemberVO member = sessionMapper.loginCheck(id);
		return member;
	}
}
