package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.StoreReservationService;

@Controller
@RequestMapping("/store")
public class StoreReservationController {
	
	private final  StoreReservationService reservationService;
		
	@Autowired
	public StoreReservationController(StoreReservationService reservationService) {
		super();
		this.reservationService = reservationService;
	}

	@GetMapping("/storeReservation")
	public String storeReservation(int storeNo, Model model) {
		model.addAttribute("reservationVO", reservationService.selectAll(storeNo));
		return "/store/storeReservation";
	}
	
	@GetMapping("/storeReservationDeletePro")
	public String storeReservationDeletePro(int reserveNo) {
		reservationService.delete(reserveNo);
		return "forward:storeReservation";
	}
}
