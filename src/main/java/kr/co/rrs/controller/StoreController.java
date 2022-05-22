package kr.co.rrs.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

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
	public String storeUpdate(StoreVO storeVO, Model model, HttpSession session) {
		storeVO = storeService.select((String) session.getAttribute("id"));
		model.addAttribute("storeVO", storeVO);
		return "/store/storeUpdate";
	}

	@RequestMapping("/myStore")
	public String myStore(Model model, HttpSession session) {
		model.addAttribute("storeVO", storeService.select((String) session.getAttribute("id")));
		return "/store/myStore";
	}

	@RequestMapping("/storeUpdatePro")
	public String storeUpdatePro(@ModelAttribute StoreVO storeVO) {
		storeService.update(storeVO);
		return "redirect:/myStore";
	}
}
