package kr.co.rrs.mapper;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;

public interface ServiceBoardMapper {
	@Insert("insert into serviceBoard values(serviceNo_SEQ.nextVal, #{id}, #{nickName}, #{title}, #{content}, #{views}, sysdate)")
	void insert(ServiceBoardVO serviceBoardVO);
	
	@Select("select * from serviceBoard order by serviceNo desc")
	List<ServiceBoardVO> selectList();
	
	@Select("select * from reply where serviceNo = #{serviceNo}")
	ReplyVO selectReply(@Param("serviceNo") int serviceNo);
	
	@Select("select * from serviceBoard where serviceNo = #{serviceNo}")
	ServiceBoardVO selectDetail(@Param("serviceNo") int serviceNo);
	
	@Update("update serviceBoard set views = views + 1 where serviceNo = #{serviceNo} and id != #{id}")
	void updateViews(@Param("serviceNo") int serviceNo, @Param("id") String id);
	
	@Update("update serviceBoard set title = #{title}, content = #{content} where serviceNo = #{serviceNo}")
	void update(@Param("serviceNo") int serviceNo, @Param("title") String title, @Param("content") String content);
	
	@Delete("delete from serviceBoard where serviceNo = #{serviceNo}")
	void delete(@Param("serviceNo") int serviceNo);
}
