package kr.co.rrs.controller;

import java.security.Principal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.rrs.service.StoreAnalysisService;

@Controller
@RequestMapping("/store")
public class StoreAnalysisController {

	private final  StoreAnalysisService storeAnalysisService;

	@Autowired
	public StoreAnalysisController(StoreAnalysisService storeAnalysisService) {
		this.storeAnalysisService = storeAnalysisService;
	}

	@RequestMapping("/storeAnalysis")
	public String storeAanlysis() {
		return "/store/storeAnalysis";
	}

	@GetMapping("/storeAnalysisPro")
	public String storeAanlysisPro(String firstDay, String lastDay, Principal principal, Model model) {
		model.addAttribute("firstDay", firstDay);
		model.addAttribute("lastDay", lastDay);
		model.addAttribute("storeAnalysis", storeAnalysisService.getAnalysis(principal.getName(), firstDay, lastDay));
		return "/store/storeAnalysisResult";
	}
}