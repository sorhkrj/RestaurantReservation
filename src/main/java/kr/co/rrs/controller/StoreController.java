package kr.co.rrs.controller;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.StoreVO;

@Controller
@RequestMapping("/store")
@SessionAttributes("storeVO")
public class StoreController {

	private final  StoreService storeService;

	@Autowired
	public StoreController(StoreService storeService) {
		super();
		this.storeService = storeService;
	}

	@GetMapping("/storeUpdate")
	public String storeUpdate(StoreVO storeVO, Model model, Principal principal) {
		model.addAttribute("storeVO", storeService.select((principal.getName())));
		return "/store/storeUpdate";
	}

	@RequestMapping("myStore")
	public String myStore(Model model, Principal principal) {
		model.addAttribute("storeVO", storeService.select(principal.getName()));
		return "/store/myStore";
	}

	@RequestMapping("/storeUpdatePro")
	public String storeUpdatePro(@ModelAttribute StoreVO storeVO, @RequestPart MultipartFile file,	HttpServletRequest request) throws IllegalStateException, IOException {
		String path = "resources/images"; // 파일 저장하고 싶은 위치
		String originalPath = request.getServletContext().getRealPath(path)+"/"+ storeService.select(storeVO.getId()).getPhoto();
		File originalFile = new File(originalPath);
		if (originalFile.exists()) {
			originalFile.delete();
		}
		
		String savePath = request.getServletContext().getRealPath(path); // 실제 파일 저장 경로
		String uuid = UUID.randomUUID().toString() + file.getOriginalFilename();
		File converFile = new File(savePath, uuid);
		file.transferTo(converFile);
		storeVO.setPhoto(uuid);
		storeService.update(storeVO);
		return "redirect:/store/myStore";
	}
}
