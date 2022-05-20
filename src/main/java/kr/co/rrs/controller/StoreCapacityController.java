package kr.co.rrs.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.rrs.service.StoreCapacityService;
import kr.co.rrs.service.StoreReservationService;
import kr.co.rrs.vo.ReservePossibleVO;

@Controller
public class StoreCapacityController {
	/*
	 * 지점 예약가능 시간 관리 기능
	 * 
	 * 
	 */

	@Autowired
	private StoreCapacityService storeCapacityService;

	@GetMapping("/storeCapacityInsert")
	public String storeCapacityInsert(int storeNo, Model model) {
		model.addAttribute("storeNo", storeNo);
		return "/store/storeCapacityInsert";
	}

	@GetMapping("/storeCapacityInsertPro")
	public String storeCapacityInsertPro(ReservePossibleVO reservePossibleVO, Model model) {
		storeCapacityService.insert(reservePossibleVO);
		return "forward:storeCapacitySelect";
	}

	@GetMapping("/storeCapacitySelect")
	public String storeCapacitySelect(int storeNo, Model model) {
		model.addAttribute("storeNo", storeNo);
		List<ReservePossibleVO> lsc = storeCapacityService.selectList(storeNo);
		List<String[]> timeList = new ArrayList<String[]>();
		for (int i = 0; i < lsc.size(); i++) {
			StringTokenizer st = new StringTokenizer(lsc.get(i).getTime(), ",");
			String[] aStrings = new String[st.countTokens()];
			int j = 0;
			while (st.hasMoreTokens()) {
				aStrings[j] = st.nextToken();
				j = j + 1;
			}
			timeList.add(aStrings);
		}
		System.out.println(timeList.get(0).length);
		System.out.println(timeList.get(0).length);
		
		model.addAttribute("timeList", timeList);
		model.addAttribute("capaList", storeCapacityService.selectList(storeNo));
		return "/store/storeCapacitySelect";
	}

	@GetMapping("/storeCapacityUpdate")
	public String storeCapacityUpdate() {
		return "/store/storeCapacityUpdate";
	}

	@GetMapping("/storeCapacityDeletePro")
	public String storeCapacityDeletePro() {
		return "/store/storeCapacitySelect";
	}

	@GetMapping("/storeCapacityUpdatePro")
	public String storeCapacityUpdatePro() {
		return "/store/storeCapacitySelect";
	}

}
