package kr.co.rrs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRange;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.service.ReservationService;

@Controller

public class ReservationController {
	
	@Autowired
	ReservationService service;
	
	@PostMapping("/reservationCheck")
	public String checkReservation() {
		
		return "reservation/reservationCheck";
	}
	
	@GetMapping("/myReservationList")
	public String listmyReservation(Model model) {
		
		ArrayList<ReservationVO> list = service.listRes("a");

		model.addAttribute("list", list);
				
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
	
	@GetMapping("/reservationSelect")
	public String selectReservation(ReservationVO rvo, Model model) {
		ReservationVO reservation = service.selectRes(rvo);
		model.addAttribute("reservation", reservation);
		return "reservation/reservationSelect";
	}
	

}