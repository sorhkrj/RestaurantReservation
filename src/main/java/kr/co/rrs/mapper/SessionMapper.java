package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MemberVO;

public interface SessionMapper {
	@Select("select * from Member where id=#{id}")
	MemberVO loginCheck(String id);
}
