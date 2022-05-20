package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;

public interface ServiceBoardMapper {
	@Insert("insert into serviceBoard values(serviceNo_SEQ.nextVal, #{id}, #{title}, #{content}, #{views}, sysdate)")
	void insert(ServiceBoardVO serviceBoardVO);
	
	@Select("select * from serviceBoard order by serviceNo desc")
	List<ServiceBoardVO> selectList();
	
	@Select("select * from reply where serviceNo = #{serviceNo}")
	ReplyVO selectReply(@Param("serviceNo") int serviceNo);
	
	@Select("select * from serviceBoard where serviceNo = #{serviceNo}")
	ServiceBoardVO selectDetail(@Param("serviceNo") int serviceNo);
	
	@Update("update serviceBoard set views = #{views} + 1 where serviceNo = #{serviceNo}")
	void updateViews(@Param("views") int views, @Param("serviceNo") int serviceNo);
	
}
