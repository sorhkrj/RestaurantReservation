package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.rss.VO.StoreVO;
import kr.co.rss.service.store.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;

	@GetMapping("/storeUpdate")
	public String storeUpdate(StoreVO storeVO) {
		return "/store/storeUpdate";
	}

	@GetMapping("/myStore")
	public String myStore(Model model) {
		model.addAttribute("svo", storeService.select("nigael"));
		return "/store/myStore";
	}

	@GetMapping("/storeUpdatePro")
	public String storeUpdatePro() {
		return "/myStore";
	}

	@GetMapping("/storeReservation")
	public String storeReservation() {
		return "/store/storeReservation";
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
