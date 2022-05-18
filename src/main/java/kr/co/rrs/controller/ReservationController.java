package kr.co.rrs.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Controller

public class ReservationController {
	
	@PostMapping("/reservationCheck")
	public String checkReservation() {
		return "reservation/reservationCheck";
	}
	
	@PostMapping("/myReservationList")
	public String listmyReservation() {
		return "reservation/myReservationList";
	}
	
	@PostMapping("/reservationUpdate")
	public String updateReservation() {
		return "reservation/reservationUpdate";
	}
	
	@PostMapping("/reservationInsert")
	public String insertReservation() {
		return "reservation/reservationInsert";
	}
	
	@PostMapping("/reservationSelect")
	public String selectReservation() {
		return "reservation/reservationSelect";
	}
	

}
