package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface AdminMapper {
	
	// 아이디 검색 결과
	List<MemberVO> searchMember(String id);
	
	// 음식점 검색 결과
	List<StoreVO> searchStore(String search);

	@Select("select * from member where id = #{id}")
	MemberVO getMember(String id);
	
	@Select("select * from store where storeno= #{storeNo}")
	StoreVO getStore(int storeNo);
	
	@Update("update member set enabled = 1 where id = #{id}")
	int memberRecoveryAdmin(String id);
}
