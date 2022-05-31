package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.MenuMapper;
import kr.co.rrs.service.MenuService;
import kr.co.rrs.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private MenuMapper menuMapper;
	
	@Override
	public void insertMenu(MenuVO menuVO) {
		menuMapper.insertMenu(menuVO);
	}

	@Override
	public void updateMenu(MenuVO menuVO) {
		System.out.println(menuVO.toString());
		menuMapper.UpdateMenu(menuVO);
	}

	@Override
	public List<MenuVO> selectMenu(String id) {
		return menuMapper.selectMenu(id);
	}

	@Override
	public void deleteMenu(String menuName) {
		System.out.println(menuName);
		menuMapper.deleteMenu(menuName);
	}

}
