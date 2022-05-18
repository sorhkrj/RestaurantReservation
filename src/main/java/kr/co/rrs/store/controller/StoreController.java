package kr.co.rrs.store.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/store")
public class StoreController {
	
	@GetMapping("/storeUpdate")
	public String storeUpdate() {
		return "/store/storeUpdate";
	}
	
	@GetMapping("/storeUpdatePro")
	public String storeUpdatePro() {
		return "/store/myStore";
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
