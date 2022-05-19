package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rss.VO.StoreVO;
import kr.co.rss.service.StoreService;

@Controller
public class StoreController {
	/*	吏��젏�젙蹂닿�由� 湲곕뒫
	 *  
	 * 	
	 */
	
	@Autowired
	private StoreService storeService;

	@GetMapping("/storeUpdate")
	public String storeUpdate(@ModelAttribute StoreVO storeVO, Model model) {
		storeVO = storeService.select("nigael");
		model.addAttribute("storeVO", storeVO);
		return "/store/storeUpdate";
	}

	@RequestMapping("/myStore")
	public String myStore(Model model) {
		model.addAttribute("storeVO", storeService.select("nigael"));
		return "/store/myStore";
	}

	@GetMapping("/storeUpdatePro")
	public String storeUpdatePro(StoreVO storeVO) {
		storeService.update(storeVO);
		return "/myStore";
	}

	@GetMapping("/storeReservation")
	public String storeReservation() {
		return "/store/storeReservation";
	}

	@GetMapping("/storeCapacityInsert")
	public String storeCapacityInsert() {
		
		return "/storeCapacitySelect";
	}
	
	@GetMapping("/storeCapacitySelect")
	public String storeCapacitySelect() {
		return "/store/storeCapacitySelect";
	}

	@GetMapping("/storeCapacityUpdate")
	public String storeCapacityUpdate() {
		return "/store/storeCapacityUpdate";
	}

	@GetMapping("/storeCapacityDeletePro")
	public String storeCapacityDeletePro() {
		return "/store/storeCapacitySelect";
	}

	@GetMapping("/storeCapacityUpdatePro")
	public String storeCapacityUpdatePro() {
		return "/store/storeCapacitySelect";
	}

	@GetMapping("/storeReservationDeletePro")
	public String storeReservationDeletePro() {
		return "/store/storeReservation";
	}
}
