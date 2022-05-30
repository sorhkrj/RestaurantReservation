package kr.co.rrs.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.StoreVO;

@Controller
@RequestMapping("/store")
@SessionAttributes("storeVO")
public class StoreController {

	@Autowired
	private StoreService storeService;

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
	public String storeUpdatePro(@ModelAttribute StoreVO storeVO) {
		storeService.update(storeVO);
		return "redirect:/store/myStore";
	}
}
