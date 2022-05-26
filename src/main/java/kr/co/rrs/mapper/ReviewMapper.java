package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.ReviewVO;
import kr.co.rrs.vo.StoreVO;

public interface ReviewMapper {
	// 지점 번호 지점 정보 가져오기
	@Select("select * from store where storeNo = #{storeNo}")
	StoreVO selectOne(@Param("storeNo") int storeNo);
	
	// 지점에 대한 좋아요 수
	@Select("select count(*) from reviewLike where storeNo = #{storeNo}")
	int selectReviewLikeCnt(@Param("storeNo") int storeNo);
	
	// 로그인 id에 대한 좋아요 체크
	@Select("select count(*) from reviewLike where storeNo = #{storeNo} and id = #{id}")
	int selectReviewLikeStatus(@Param("storeNo") int storeNo, @Param("id") String id);
	
	// 좋아요 누름 insert
	@Insert("insert into reviewLike values(reviewLikeNo_SEQ.nextVal, #{storeNo}, #{id})")
	void insertReviewLike(@Param("storeNo") int storeNo, @Param("id") String id);
	
	// 좋아요 취소 delete
	@Delete("delete from reviewLike where storeNo = #{storeNo} and id = #{id}")
	void deleteReviewLike(@Param("storeNo") int storeNo, @Param("id") String id);
	
	// ------------------------------------------------------------------------------------
	// 리뷰 insert
	@Insert("insert into review values(reviewNo_SEQ.nextVal, #{rating}, #{reviewNickName}, #{storeNo}, #{reviewPhoto}, #{reviewContent}, to_date(sysdate, yyyy-mm-dd hh-mm-ss))")
	void insertReview(ReviewVO reviewVO);
}
