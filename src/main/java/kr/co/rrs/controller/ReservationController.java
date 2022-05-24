package kr.co.rrs.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;
import kr.co.rrs.service.ReservationService;

@Controller
public class ReservationController {
	
	@Autowired
	ReservationService service;
	
	/////////////////////////insert//////////////////////////////
	
	@GetMapping("/reservationInsert")
	public String insertReservation(StoreVO svo, HttpServletRequest request, Model model) {
		
		int storeNo = svo.getStoreNo();
		StoreVO storevo = service.checkStore(storeNo);
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberVO mvo = service.checkMember(id);
		System.out.println(mvo.getName());
		System.out.println(mvo.getPhone());
		model.addAttribute("mvo", mvo);
	//	ArrayList<ReservePossibleVO> list = service.checkPossibility(ReservationVO rvo );
	//	model.addAttribute("list", list);
		model.addAttribute("storevo", storevo);
		return "reservation/reservationInsert";
	}
	
	
	@PostMapping("/reservationInsertCheck")
	public String insertCheckReservation(ReservationVO rvo, Model model) {
		
		model.addAttribute("rvo",rvo);
		
		return "reservation/reservationInsertCheck";
	}
	
	@PostMapping("/reservationInsertPro")
	public String insertReservation(ReservationVO rvo, HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		rvo.setId((String)session.getAttribute("id"));
				
		service.insertRes(rvo);
		return "redirect:/myReservationList";
	}
	
	////////////////////////////////update/////////////////////////////////////
	
	@PostMapping("/reservationUpdate")
	public String updateReservation(ReservationVO rvo, HttpServletRequest request, Model model) {
		
		
		ArrayList<ReservePossibleVO> list = service.checkPossibility(rvo);
		model.addAttribute("list", list);
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		MemberVO mvo = service.checkMember(id);
		
		model.addAttribute("rvo",rvo);
		model.addAttribute("mvo",mvo);
		return "reservation/reservationUpdate";
	}
	
	@PostMapping("/reservationUpdateCheck")
	public String updateCheckReservation(ReservationVO rvo, Model model) {
		model.addAttribute("rvo",rvo);
		return "reservation/reservationUpdateCheck";
	}

	@PostMapping("/reservationUpdatePro")
	public String updateCheckReservationPro(ReservationVO rvo) {
		service.updateRes(rvo);
		return "redirect:/myReservationList";
	}

	////////////////////////////////List//////////////////////////////////
	
	@GetMapping("/myReservationList")
	public String listmyReservation(HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		ArrayList<ReservationVO> list = service.listRes(id);
		model.addAttribute("list", list);
		return "reservation/myReservationList";
	}
	
	@GetMapping("/reservationSelect")
	public String selectReservation(HttpServletRequest request, Model model) {
		int rno = Integer.valueOf(request.getParameter("reserveNo"));
		ReservationVO reservation = service.selectRes(rno);
		model.addAttribute("reservation", reservation);
		return "reservation/reservationSelect";
	}
	
	////////////////////////////////delete///////////////////////////////////////
	
	@PostMapping("/reservationDelete")
	public String deleteReservation(ReservationVO rvo, HttpServletRequest request, Model model) {
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		String password = request.getParameter("password");
		MemberVO mvo = service.checkMember(id);
		if(mvo.getPassword().equals(password))
		{
			service.deleteRes(rvo.getReserveNo());
		}
		return "redirect:/myReservationList";
	}
}