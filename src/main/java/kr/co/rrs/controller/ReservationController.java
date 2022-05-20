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
	public String insertCheckReservation(ReservationVO rvo, Model model) {
		
		model.addAttribute("rvo",rvo);
		
		return "reservation/reservationInsertCheck";
	}
	
	@PostMapping("/reservationInsertPro")
	public String insertReservation(ReservationVO rvo) {
		
		return "redirect:myReservationList";
	}
	
	@PostMapping("/reservationUpdate")
	public String updateReservation(ReservationVO rvo, Model model) {
				
		model.addAttribute("rvo",rvo);
		return "reservation/reservationUpdate";
	}
	
	@PostMapping("/reservationUpdateCheck")
	public String updateCheckReservation(ReservationVO rvo, Model model) {
		model.addAttribute("rvo",rvo);
		return "reservation/reservationUpdateCheck";
	}

	@PostMapping("/reservationUpdatePro")
	public String updateCheckReservationPro(ReservationVO rvo, Model model) {
		service.updateRes(rvo);
		return "redirect:myReservationList";
	}

	
	@GetMapping("/myReservationList")
	public String listmyReservation(Model model) {
		
		ArrayList<ReservationVO> list = service.listRes("a");

		model.addAttribute("list", list);
				
		return "reservation/myReservationList";
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