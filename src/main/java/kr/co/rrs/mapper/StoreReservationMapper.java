package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.ReservationVO;

public interface StoreReservationMapper {

	@Select("select * from reservation where storeNo = #{storeNo}")
	List<ReservationVO> selectAll(int storeNo);
	
	@Delete("delete from reservation where reserveNo = #{reserveNo}")
	void delete(int reserveNo);

	
	
}
