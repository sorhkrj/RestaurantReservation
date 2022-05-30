package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface HomeMapper {
	
	/* SQL Mapper 사용법 */
	// @CRUD("SQL") // #{value}
	// 반환값 curd(Value value);
	
	//로그인 확인
	@Select("select * from Member where id=#{id}")
	MemberVO selectMember(String id);
	
	@Select("select nickname from Member where id=#{id}")
	String selectNickname(String id);
	
	//검색 결과 예약 페이지
	@Select("select * from store where storeName like '%'||#{search}||'%'")
	List<StoreVO> selectStore(String search);
}
