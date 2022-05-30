package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;

public interface ServiceBoardMapper {
	@Insert("insert into serviceBoard values(serviceNo_SEQ.nextVal, #{id}, #{title}, #{content}, #{views}, sysdate)")
	void insert(ServiceBoardVO serviceBoardVO);
	
	//// 수정
	@Select("select * from (select rownum as rnum, c.* from (select * from serviceBoard a left outer join member b on a.id = b.id order by a.serviceNo desc) c)\r\n"
			+ "where rnum >= #{startBoard} and rnum <= #{endBoard}")
	List<ServiceBoardVO> selectList(@Param("startBoard") int startBoard, @Param("endBoard") int endBoard);
	
//	@Select("select * from serviceBoard a left outer join member b on a.id = b.id order by a.serviceNo desc")
//	List<ServiceBoardVO> selectList(@Param("startBoard") int startBoard, @Param("endBoard") int endBoard);
	
	@Select("select * from reply a left outer join member b on a.id = b.id where serviceNo = #{serviceNo}")
	ReplyVO selectReply(@Param("serviceNo") int serviceNo);
	
//	@Select("select * from reply where serviceNo = #{serviceNo}")
//	ReplyVO selectReply(@Param("serviceNo") int serviceNo);
	
	@Select("select * from serviceBoard a left outer join member b on a.id = b.id where a.serviceNo = #{serviceNo}")
	ServiceBoardVO selectDetail(@Param("serviceNo") int serviceNo);
	
//	@Select("select * from serviceBoard where serviceNo = #{serviceNo}")
//	ServiceBoardVO selectDetail(@Param("serviceNo") int serviceNo);
	
	@Update("update serviceBoard set views = views + 1 where serviceNo = #{serviceNo} and id != #{id}")
	void updateViews(@Param("serviceNo") int serviceNo, @Param("id") String id);
	
	@Update("update serviceBoard set title = #{title}, content = #{content} where serviceNo = #{serviceNo}")
	void update(@Param("serviceNo") int serviceNo, @Param("title") String title, @Param("content") String content);
	
	@Delete("delete from serviceBoard where serviceNo = #{serviceNo}")
	void delete(@Param("serviceNo") int serviceNo);
	
	// 문의글 전체 개수 구하기
	@Select("select count(*) from serviceBoard")
	int selectServiceBoardTotal();
}
