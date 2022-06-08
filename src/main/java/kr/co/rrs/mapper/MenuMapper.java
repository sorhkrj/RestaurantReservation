package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.MenuVO;

public interface MenuMapper {
	@Insert("insert into menu values(#{menuName}, (select storeno from store where id = #{id}), #{price}, #{menuInfo},#{menuPhoto}, 1)")
	void insertMenu(MenuVO menuVO);

	@Select("select * from menu where storeno = (select storeno from store where id = #{id})")
	List<MenuVO> selectMenu(String id);

	@Delete("delete from menu where menuName = #{menuName}")
	void deleteMenu(String menuName);

	@Update("update menu set menuname = #{nameModified}, price = #{price}, menuInfo = #{menuInfo}, menuphoto = #{menuPhoto} where menuname=#{menuName}")
	void UpdateMenu(MenuVO menuVO);
	
	@Select("select * from menu where menuName = #{menuName}")
	MenuVO selectMenuOne(String menuName);
}