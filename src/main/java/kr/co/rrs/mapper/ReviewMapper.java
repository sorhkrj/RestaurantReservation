package kr.co.rrs.mapper;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.MenuVO;
import kr.co.rrs.vo.ReviewCommentVO;
import kr.co.rrs.vo.ReviewJoinMemberVO;
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
	@Insert("insert into review values(reviewNo_SEQ.nextVal, #{rating}, #{id}, #{storeNo}, #{reviewPhoto}, #{reviewContent}, sysdate)")
	void insertReview(ReviewVO reviewVO);
	
	// 리뷰 전체 검색
	@Select("select * from review where storeNo = #{storeNo} order by reviewNo desc")
	ArrayList<ReviewVO> selectReviewALL(@Param("storeNo") int storeNo);
	
	// 리뷰 조인 검색
	@Select("select reviewNo, rating, nickname, storeno, reviewphoto, reviewcontent, reviewrdate from review r join member m on r.id = m.id where storeNo = #{storeNo} order by reviewNo desc")
	ArrayList<ReviewJoinMemberVO> selectReviewJoinMember(@Param("storeNo") int storeNo);
	
	// 리뷰 삭제
	@Delete("delete from review where storeNo = #{storeNo} and reviewNo = #{reviewNo}")
	void deleteReview(@Param("storeNo") int storeNo, @Param("reviewNo") int reviewNo);
	
	// 리뷰 댓글 전체 검색
	@Select("select * from reviewComment")
	ArrayList<ReviewCommentVO> selectReviewCommentAll();
	
	// 리뷰 댓글 삽입
	@Insert("insert into reviewComment values(reviewCommentNo_SEQ.nextVal, #{reviewNo}, #{id}, #{reviewCommentContent}, sysdate)")
	void insertReviewComment(ReviewCommentVO reviewCommentVO);
	
	// 리뷰 댓글 삭제
	@Delete("delete from reviewComment where reviewCommentNo = #{reviewCommentNo}")
	void deleteReviewComment(ReviewCommentVO reviewCommentVO);

	// 메뉴 리스트 검색
	@Select("select * from menu where storeno = #{storeNo}")
	List<MenuVO> selectMenu(int storeNo);
		
}
