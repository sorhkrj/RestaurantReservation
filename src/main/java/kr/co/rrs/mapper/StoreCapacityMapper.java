package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.VO.ReservePossibleVO;

public interface StoreCapacityMapper {
	
	@Insert("insert into reservepossible values(#{storeNo}, #{day}, #{time}, #{capacity}, #{seat})")
	void insert(ReservePossibleVO reservePossibleVO);
	
	@Update("update reservepossible values(#{storeNo}, #{day}, #{time}, #{capacity}, #{seat})")
	void update(ReservePossibleVO reservePossibleVO);
	
	@Select("select * from store where storeno = #{storeno} and day >= SYSDATE")
	List<ReservePossibleVO> selectList(int storeNo);
	
	@Select("select * from store where storeno = #{storeno} and day =#{day}")
	ReservePossibleVO select(String day, int storeno);
	
	@Delete("delete from store where shoreno = #{storeno} and day = #{day}")
	void delete(String day, int storeno);
}
