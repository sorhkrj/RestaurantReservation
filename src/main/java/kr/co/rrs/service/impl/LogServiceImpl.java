package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.LogMapper;
import kr.co.rss.VO.MemberVO;

@Service
public class LogServiceImpl implements LogMapper {

	@Autowired
	private LogMapper logMapper;

	@Override
	public List<MemberVO> select(String id) {
		return logMapper.select(id);
	}
}
