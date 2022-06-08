package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.HomeMapper;
import kr.co.rrs.service.HomeService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

@Service
public class HomeServiceImpl implements HomeService {
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	HomeMapper mapper;

	//로그인 확인
	@Override
	public Boolean loginCheck(String id, String password) {
		MemberVO member = mapper.selectMember(id);
		if (member != null) {
			if (encoder.matches(password, member.getPassword())) {
				return true;
			}
		}
		return false;
	}
	
	// 닉네임 검색
	@Override
	public String selectNickname(String id) {
		return mapper.selectNickname(id);
	}

	//검색 결과 예약 페이지
	@Override
	public List<StoreVO> searchResultList(String search) {
		List<StoreVO> StoreList = mapper.selectStore(search);
		return StoreList;
	}
	
	public List<ReviewVO> selectReview(){
		List<ReviewVO> rlist = mapper.selectReview();
		return rlist;
	}
	
}
