package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rrs.VO.ReservePossibleVO;
import kr.co.rrs.VO.StoreVO;
import kr.co.rrs.service.StoreService;

@Controller
@SessionAttributes("storeVO")
public class StoreController {
	/*	지점정보관리 기능
	 *  
	 * 	
	 */

	@Autowired
	private StoreService storeService;

	@GetMapping("/storeUpdate")
	public String storeUpdate(StoreVO storeVO, Model model) {
		storeVO = storeService.select("nigael");
		model.addAttribute("storeVO", storeVO);
		return "/store/storeUpdate";
	}

	@RequestMapping("/myStore")
	public String myStore(Model model) {
		model.addAttribute("storeVO", storeService.select("nigael"));
		return "/store/myStore";
	}

	@RequestMapping("/storeUpdatePro")
	public String storeUpdatePro(@ModelAttribute StoreVO storeVO) {
		storeService.update(storeVO);
		return "redirect:/myStore";
	}
}
