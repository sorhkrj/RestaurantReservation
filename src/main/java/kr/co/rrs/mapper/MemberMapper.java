package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MemberVO;

public interface MemberMapper {

	@Insert("insert into member values(#{id}, #{name}, #{phone}, #{password},#{nickname},#{memberLevel}, SYSDATE)")
	void insert(MemberVO memberVO);
	
	@Select("select * from member where id = #{id}")
	MemberVO selectOne(String id);
	
} 