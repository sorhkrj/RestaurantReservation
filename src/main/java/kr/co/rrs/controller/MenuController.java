package kr.co.rrs.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.co.rrs.service.MenuService;
import kr.co.rrs.vo.MenuVO;

@Controller
@RequestMapping("/store")
public class MenuController {
	private final MenuService menuService;
	
	@Autowired
	public MenuController(MenuService menuService) {
		this.menuService = menuService;
	}
	
	@RequestMapping("/menuDetail")
	public String menu(Principal principal, Model model) {
		List<MenuVO> mvo= menuService.selectMenu(principal.getName());
		model.addAttribute("menuList", mvo);
		return "/store/menu/menuDetail";
	}
	@PostMapping("/menuInsert")
	@ResponseBody
	public MenuVO menuInsert(MenuVO menuVO, @RequestPart MultipartFile file, HttpServletRequest request) throws IOException {
		String path = "resources/images"; // 파일 저장하고 싶은 위치
		String savePath = request.getServletContext().getRealPath(path); // 실제 파일 저장 경로
		String uuid = UUID.randomUUID().toString() + file.getOriginalFilename();
		File converFile = new File(savePath, uuid);
		file.transferTo(converFile);
		menuVO.setMenuPhoto(uuid);
		menuService.insertMenu(menuVO);
		return menuVO;
	}

	@PostMapping("/menuUpdate")
	@ResponseBody
	public MenuVO menuUpdate(MenuVO menuVO, @RequestPart MultipartFile file, HttpServletRequest request) throws IOException {
		String path = "resources/images"; // 파일 저장하고 싶은 위치
		String originalPath = request.getServletContext().getRealPath(path)+"/"+ menuService.selectMenuOne(menuVO.getMenuName()).getMenuPhoto();
		System.out.println(originalPath);
		File originalFile = new File(originalPath);
		if (originalFile.exists()) {
			originalFile.delete();
		}
		String savePath = request.getServletContext().getRealPath(path); // 실제 파일 저장 경로
		String uuid = UUID.randomUUID().toString() + file.getOriginalFilename();
		File converFile = new File(savePath, uuid);
		file.transferTo(converFile);
		menuVO.setMenuPhoto(uuid);
		menuService.updateMenu(menuVO);
		return menuVO;
	}

	@GetMapping("/menuDelete")
	@ResponseBody
	public void menuDelete(String menuName) {
		menuService.deleteMenu(menuName);
	}

}
