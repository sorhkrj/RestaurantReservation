package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.StoreVO;

public interface ReviewMapper {
	// 지점 번호 지점 정보 가져오기
	@Select("select * from store where storeNo = #{storeNo}")
	StoreVO selectOne(@Param("storeNo") int storeNo);
	
	// 지점에 대한 좋아요 수
	@Select("select count(*) from reviewLike where storeNo = #{storeNo}")
	int selectReivewLikeCnt(@Param("storeNo") int storeNo);
}
