package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReservePossibleVO;

public interface StoreCapacityMapper {

	@Insert("insert into reservepossible values(#{storeNo}, #{day}, #{time}, #{capacity}, #{seat})")
	void insert(ReservePossibleVO reservePossibleVO);

	@Update("update reservepossible set time = #{time}, capacity = #{capacity}, seat = #{seat} where storeNo = #{storeNo} and day = substr(#{day}, 1, 10)")
	void update(ReservePossibleVO reservePossibleVO);

	@Select("select storeNo, to_char(day, 'YYYY-MM-DD') as day, time, capacity, seat from reservepossible where storeNo = #{storeNo} and day >= SYSDATE order by day")
	List<ReservePossibleVO> selectList(@Param("storeNo")int storeNo);

	@Select("select storeNo, to_char(day, 'YYYY-MM-DD') as day, time, capacity, seat from reservepossible where storeNo = #{storeNo} and day = TO_DATE(#{day}, 'YYYY-MM-DD HH24:MI:SS')")
	ReservePossibleVO selectOne(@Param("storeNo") int storeNo, @Param("day") String day);

	@Delete("delete from reservepossible where storeNo = #{storeNo} and day = TO_DATE(#{day}, 'YYYY-MM-DD HH24:MI:SS')")
	void delete(@Param("storeNo")int storeNo, @Param("day")String day);
}
