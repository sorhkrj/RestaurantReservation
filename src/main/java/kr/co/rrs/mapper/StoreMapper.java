package kr.co.rrs.mapper;

import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.StoreVO;

public interface StoreMapper {

	@Update("update store set id = #{id}, storeName = #{storeName}, photo = #{photo}, location = #{location},"
			+"category = #{category}, store_phone = #{store_phone}, parking = #{parking}, holyday = #{holyday}, introduce = #{introduce}, notice = #{notice} where storeno = #{storeNo}")
	void update(StoreVO storeVO);
	
	@Select("select * from store where id = #{id}")
	StoreVO select(String id);
	
}
