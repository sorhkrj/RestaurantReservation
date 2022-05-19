package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.VO.ServiceBoardVO;

public interface ServiceBoardMapper {
	@Select("select * from serviceBoard order by serviceNo desc")
	List<ServiceBoardVO> selectList();
	
	@Insert("insert into serviceBoard values(serviceNo_SEQ.nextVal, #{id}, #{title}, #{content}, #{views}, sysdate)")
	void insert(ServiceBoardVO serviceBoardVO);
}
