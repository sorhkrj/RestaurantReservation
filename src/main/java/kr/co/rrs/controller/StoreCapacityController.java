package kr.co.rrs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kr.co.rrs.VO.ReservePossibleVO;
import kr.co.rrs.service.StoreCapacityService;

@Controller
public class StoreCapacityController {
	/*	지점 예약가능 시간 관리 기능
	 *  
	 * 	
	 */
//	
//	@Autowired
//	private StoreCapacityService storeCapacityService;
//
//	@GetMapping("/storeCapacityInsert")
//	public String storeCapacityInsert() {
//		
//		return "/storeCapacitySelect";
//	}
//	
//	@GetMapping("/storeCapacitySelect")
//	public String storeCapacitySelect(int storeNo, Model model) {
//		model.addAttribute("storeCapacityVO", storeCapacityService.selectList(2));
//		return "/store/storeCapacitySelect";
//	}
//
//	@GetMapping("/storeCapacityUpdate")
//	public String storeCapacityUpdate() {
//		return "/store/storeCapacityUpdate";
//	}
//
//	@GetMapping("/storeCapacityDeletePro")
//	public String storeCapacityDeletePro() {
//		return "/store/storeCapacitySelect";
//	}
//
//	@GetMapping("/storeCapacityUpdatePro")
//	public String storeCapacityUpdatePro() {
//		return "/store/storeCapacitySelect";
//	}

}
