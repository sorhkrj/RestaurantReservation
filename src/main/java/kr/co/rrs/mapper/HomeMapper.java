package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface HomeMapper {
	//로그인 확인
	@Select("select * from Member where id=#{id}")
	MemberVO loginCheck(String id);
	
	//검색 결과 예약 페이지
	@Select("select * from store")
	List<StoreVO> searchResultList();
}
