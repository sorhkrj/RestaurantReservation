package kr.co.rrs.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rrs.service.MenuService;
import kr.co.rrs.vo.MenuVO;

@Controller
@RequestMapping("/store")
public class MenuController {
	@Autowired
	MenuService menuService;

	@RequestMapping("/menuDetail")
	public String menu(Principal principal, Model model) {
		List<MenuVO> mvo= menuService.selectMenu(principal.getName());
		model.addAttribute("menuList", mvo);
		return "/store/menu/menuDetail";
	}
	@PostMapping("/menuInsert")
	@ResponseBody
	public Object menuInsert(@RequestBody MenuVO menuVO) {
		menuService.insertMenu(menuVO);
		return menuVO;
	}

	@PostMapping("/menuUpdate")
	@ResponseBody
	public Object menuUpdate(@RequestBody MenuVO menuVO) {
		menuService.updateMenu(menuVO);
		return menuVO;
	}

	@GetMapping("/menuDelete")
	@ResponseBody
	public void menuDelete(String menuName) {
		menuService.deleteMenu(menuName);
	}

}
