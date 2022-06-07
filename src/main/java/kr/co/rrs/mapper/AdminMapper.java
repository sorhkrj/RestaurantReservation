package kr.co.rrs.mapper;

import java.util.List;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface AdminMapper {
	
	// 아이디 검색 결과
	List<MemberVO> searchMember(String id);
	
	// 음식점 검색 결과
	List<StoreVO> searchStore(String search);
}
