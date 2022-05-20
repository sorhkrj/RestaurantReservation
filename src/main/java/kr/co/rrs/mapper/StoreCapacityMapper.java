package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReservePossibleVO;

public interface StoreCapacityMapper {

	@Insert("insert into reservepossible values(#{storeNo}, #{day}, #{time}, #{capacity}, #{seat})")
	void insert(ReservePossibleVO reservePossibleVO);

	@Update("update reservepossible set time = #{time}, capacity = #{capacity}, seat = #{seat} where storeNo = #{storeNo} and day = #{day})")
	void update(ReservePossibleVO reservePossibleVO);

	@Select("select * from reservepossible where storeNo = #{storeNo} and day >= SYSDATE")
	List<ReservePossibleVO> selectList(int storeNo);

	@Select("select * from reservepossible where storeNo = #{storeNo} and day = #{day}")
	ReservePossibleVO select(int storeNo, String day);

	@Delete("delete from store where storeNo = #{storeNo} and day = #{day}")
	void delete(int storeNo, String day);
}
