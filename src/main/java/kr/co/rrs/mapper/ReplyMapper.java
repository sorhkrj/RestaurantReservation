package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReplyVO;

public interface ReplyMapper {
	@Insert("insert into reply values(replyNo_seq.nextVal, #{serviceNo}, #{id}, #{answer}, sysdate)")
	void insertReply(ReplyVO replyVO);
	
	@Update("update reply set answer = #{answer} where replyNo = #{replyNo}")
	void updateReply(ReplyVO replyVO);
	
	@Delete("delete from reply where replyNo = #{replyNo}")
	void deleteReply(ReplyVO replyVO);
}
