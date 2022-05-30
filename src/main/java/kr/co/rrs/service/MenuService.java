package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.MenuVO;

public interface MenuService {
	void insertMenu(MenuVO menuVO);

	void updateMenu(MenuVO menuVO);

	List<MenuVO> selectMenu(String id);

	void deleteMenu(String menuName);
}