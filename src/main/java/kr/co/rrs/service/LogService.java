package kr.co.rrs.service;

import java.util.List;

import kr.co.rss.VO.MemberVO;

public interface LogService {
	List<MemberVO> select(String id);
}
