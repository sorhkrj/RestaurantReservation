package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.service.StoreReservationService;
import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

@Controller
@RequestMapping("/store")
public class StoreReservationController {
	
	@Autowired
	private StoreReservationService reservationService;

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
