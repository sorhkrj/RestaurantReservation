package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

@Controller
public class StoreReservationController {
	/*	지점 정보관리 기능
	 *  
	 * 	
	 */
	
	@Autowired
	private StoreService storeService;

	@GetMapping("/storeReservation")
	public String storeReservation() {
		return "/store/storeReservation";
	}
	
	@GetMapping("/storeReservationDeletePro")
	public String storeReservationDeletePro() {
		return "/store/storeReservation";
	}
}
