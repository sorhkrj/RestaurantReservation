package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;

import kr.co.rss.VO.MemberVO;

public interface LogMapper {

	@Select("select * from member where id=#{id}")
	List<MemberVO> select(String id);
}
