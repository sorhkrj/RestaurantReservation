package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

public interface HomeMapper {
	
	/* SQL Mapper 사용법 */
	// @CRUD("SQL") // #{value}
	// 반환값 curd(Value value);
	
	// 로그인 확인
	MemberVO selectMember(String id);

	// 닉네임 검색
	String selectNickname(String id);
	
	// 검색 결과 예약 페이지
	List<StoreVO> selectStore(String search);
	
	@Select("select r.*, s.storeName from review r, store s where r.storeno = s.storeno and rownum < 4 order by reviewrdate desc")
	List<ReviewVO> selectReview();
}
