package kr.co.rrs.controller;

import java.security.Principal;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.rrs.service.ReservationService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

@Controller
@RequestMapping("/reservation")
public class ReservationController {
	
	private final ReservationService service;
	
	@Autowired
	public ReservationController(ReservationService service) {
		super();
		this.service = service;
	}

	/////////////////////////insert//////////////////////////////
	
	@GetMapping("/reservationInsert")
	public String insertReservation(StoreVO svo, Principal principal, Model model) {
		
		int storeNo = svo.getStoreNo();
		StoreVO storevo = service.checkStore(storeNo);
		String id = principal.getName();
		MemberVO mvo = service.checkMember(id);
		model.addAttribute("mvo", mvo);
		ArrayList<ReservePossibleVO> list = service.storeCheckPossibility(storevo);
		model.addAttribute("list", list);
		model.addAttribute("storevo", storevo);
		return "reservation/reservationInsert";
		
		//예약가능한 인원
	}
	
	
	@PostMapping("/reservationInsertCheck")
	public String insertCheckReservation(ReservationVO rvo, Model model) {
		model.addAttribute("rvo",rvo);
		
		return "reservation/reservationInsertCheck";
	}
	
	@PostMapping("/reservationInsertPro")
	public String insertReservation(ReservationVO rvo, Principal principal) {
		rvo.setId(principal.getName());
		
		service.insertRes(rvo);
		return "redirect:myReservationList";
	}
	
	////////////////////////////////update/////////////////////////////////////
	
	@PostMapping("/reservationUpdate")
	public String updateReservation(ReservationVO rvo, Principal principal, Model model) {
		String id = principal.getName();
		MemberVO mvo = service.checkMember(id);
		model.addAttribute("rvo",rvo);
		model.addAttribute("mvo",mvo);
		
		return "reservation/reservationUpdate";
	}
	
	@RequestMapping("/reservationUpdateCheck")
	public String updateCheckReservation(ReservationVO rvo, Model model) {
		model.addAttribute("rvo",rvo);
		return "reservation/reservationUpdateCheck";
	}

	@PostMapping("/reservationUpdatePro")
	public String updateCheckReservationPro(ReservationVO rvo) {
		service.updateRes(rvo);
		return "redirect:myReservationList";
	}

	////////////////////////////////List//////////////////////////////////
	
	@RequestMapping("/myReservationList")
	public String listmyReservation(Principal principal, Model model) {
		String id = principal.getName();
		ArrayList<ReservationVO> list = service.listRes(id);
		model.addAttribute("list", list);
		return "reservation/myReservationList";
	}
	
	@GetMapping("/reservationSelect")
	public String selectReservation(HttpServletRequest request, Model model) {
		int rno = Integer.valueOf(request.getParameter("reserveNo"));
		ReservationVO reservation = service.selectRes(rno);
		reservation.setStoreName(request.getParameter("storeName"));
		model.addAttribute("reservation", reservation);
		return "reservation/reservationSelect";
	}
	
	////////////////////////////////delete///////////////////////////////////////
	
	@PostMapping("/reservationDelete")
	public String deleteReservation(ReservationVO rvo, HttpServletRequest request, HttpServletResponse response, Principal principal, Model model) {
		
		String id = principal.getName();
		String password = request.getParameter("password");
		service.deleteRes(rvo.getReserveNo(), id, password, response);
		return "forward:myReservationList";
		
	}
	
	//////////////////////Ajar////////////////////////
	
	@RequestMapping("/reservationTime")
	@ResponseBody
	public Object reservationTime(ReservationVO rvo) {
		ArrayList<String> listResult = service.reservationTimeCheck(rvo);
		return listResult;
	}
}