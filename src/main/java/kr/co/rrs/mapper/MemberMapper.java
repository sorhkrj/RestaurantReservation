package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MemberVO;

public interface MemberMapper {
	//회원가입
	@Insert("insert into member values(#{id}, #{name}, #{phone}, #{password},#{nickname},#{memberLevel}, SYSDATE)")
	void insert(MemberVO memberVO);
	//회원정보
	@Select("select * from member where id = #{id}")
	MemberVO selectOne(String id);
	//회원탈퇴
	@Delete("delete from member where id=#{id}")
	void delete(MemberVO memberVO);

	
} 