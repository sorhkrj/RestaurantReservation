package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.StoreVO;

public interface StoreMapper {

	@Update("update store values(storeno_seq.nextval, #{id}, #{storeName}, #{photo}, #{location},#{category},#{store_phone},#{parking},#{holyday}, #{introduce},#{notice})")
	void update(StoreVO storeVO);
	
	@Select("select * from store where id = #{id}")
	StoreVO select(String id);
	
	
}
