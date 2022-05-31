package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

public interface MemberMapper {
	// 회원가입
	@Insert("insert into member values(#{id}, #{name}, #{phone}, #{password},#{nickname}, 'ROLE_USER', 1, SYSDATE)")
	void insert(MemberVO memberVO);

	@Insert("insert into member values(#{id}, #{name}, #{phone}, #{password},#{nickname}, 'ROLE_MANAGER', 1, SYSDATE)")
	void insert2(EnterpriseVO enterpriseVO);

	// 엔터프라이즈 가입
	@Insert("insert into store values(storeno_seq.nextval, #{id}, #{storeName}, #{photo}, #{location}, #{category}, #{store_phone}, #{parking}, #{holyday}, #{introduce}, #{notice})")
	void insertEnterprise(EnterpriseVO enterpriseVO);

	// 회원정보
	@Select("select * from member where id = #{id}")
	MemberVO selectOne(String id);

	// 회원탈퇴
	@Delete("delete from member where id=#{id}")
	void delete(String id);

	// 회원수정
	@Update("UPdate member set name=#{name}, phone=#{phone}, password=#{password},nickname=#{nickname} where id=#{id}")
	void Update(MemberVO memberVO);
}