package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.HomeMapper;
import kr.co.rrs.service.HomeService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

@Service
public class HomeServiceImpl implements HomeService {
	@Autowired
	HomeMapper homeMapper;

	//로그인 확인
	@Override
	public MemberVO loginCheck(String id) {
		MemberVO member = homeMapper.loginCheck(id);
		return member;
	}

	//검색 결과 예약 페이지
	@Override
	public List<StoreVO> searchResultList() {
		List<StoreVO> reservationList = homeMapper.searchResultList();
		return reservationList;
	}
}
