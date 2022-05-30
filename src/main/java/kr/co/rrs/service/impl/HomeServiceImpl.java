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

	/* ServiceImpl 사용법 */
	// @Autowired // Singleton
	// Mapper mapper;
	
	//@Override // Service에 있는 함수
	//public 반환값 function(SQL value) { // #{value}에 들어갈 변수
		// 반환값 result = mapper.crud(value);
		// return result;
	//}
	
	@Autowired
	HomeMapper mapper;

	//로그인 확인
	@Override
	public MemberVO loginCheck(String id, String password) {
		MemberVO member = mapper.selectMember(id);
		if (password.equals(member.getPassword())) {
			return member;
		}
		return null;
	}
	
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
}
