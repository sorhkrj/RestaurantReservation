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
	
	@PostMapping("/reservationInsertCheck")
	public String checkReservation(ReservationVO rvo, Model model) {
		
		model.addAttribute("rvo",rvo);
				
		return "reservation/reservationInsertCheck";
	}
	
	@PostMapping("/reservationInsert")
	public String insertReservation(ReservationVO rvo) {
		
		return "reservation/reservationInsert";
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
	
	
	@GetMapping("/reservationDelete")
	public String deleteReservation(HttpServletRequest request, Model model) {
		int rno = Integer.valueOf(request.getParameter("reserveNo"));
		service.selectRes(rno);
		
		ArrayList<ReservationVO> list = service.listRes("a");
		model.addAttribute("list", list);
		return "reservation/reservationList";
	}
	
	@GetMapping("/reservationSelect")
	public String selectReservation(HttpServletRequest request, Model model) {
		int rno = Integer.valueOf(request.getParameter("reserveNo"));
		ReservationVO reservation = service.selectRes(rno);
		model.addAttribute("reservation", reservation);
		return "reservation/reservationSelect";
	}
	

}