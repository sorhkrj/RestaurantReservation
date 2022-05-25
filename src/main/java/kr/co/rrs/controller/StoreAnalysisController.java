package kr.co.rrs.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.service.StoreAnalysisService;
import kr.co.rrs.service.StoreReservationService;
import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

@Controller
public class StoreAnalysisController {
	/*
	 * 지점 정보관리 기능
	 * 
	 * 
	 */

	@Autowired
	private StoreAnalysisService storeAnalysisService;

	@GetMapping("/storeAnalysis")
	public String storeAanlysis(Model model) {
		int a = 2;
		model.addAttribute("storeNo", a);
		return "/store/storeAnalysis";
	}

	@GetMapping("/storeAnalysisPro")
	public String storeAanlysisPro(int storeNo, String firstDay, String lastDay, Model model) {
		model.addAttribute("firstDay", firstDay);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("storeAnalysis", storeAnalysisService.getAnalysis(storeNo, firstDay, lastDay));
		return "/store/storeAnalysisResult";
	}
}