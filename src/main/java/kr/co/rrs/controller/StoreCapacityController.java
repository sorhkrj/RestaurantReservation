package kr.co.rrs.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import kr.co.rrs.service.StoreCapacityService;
import kr.co.rrs.vo.ReservePossibleVO;

@Controller
@RequestMapping("/store")
@SessionAttributes("reservePossibleVO")
public class StoreCapacityController {

	private final StoreCapacityService storeCapacityService;

	@Autowired
	public StoreCapacityController(StoreCapacityService storeCapacityService) {
		this.storeCapacityService = storeCapacityService;
	}

	@ModelAttribute("/reservePossibleVO")
	public ReservePossibleVO initVO(ReservePossibleVO reservePossibleVO) {
		return reservePossibleVO;
	}
	
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
		model.addAttribute("timeList", storeCapacityService.toArray_Times(lsc));
		model.addAttribute("capaList", lsc);
		return "/store/storeCapacitySelect";
	}
	
	@GetMapping("/storeCapacityUpdate")
	public String storeCapacityUpdate(int storeNo, String day, Model model) {
		ReservePossibleVO rvo = storeCapacityService.selectOne(storeNo, day);
		String[] check = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12","13", "14", "15", "16", "17", "18", "19", "20", "21", "22", "23", "24"};
		model.addAttribute("timeCheck", check);
		rvo.setTimeList(storeCapacityService.toArray_Time(rvo));
		model.addAttribute("reservePossibleVO", rvo);
		return "/store/storeCapacityUpdate";
	}

	@GetMapping("/storeCapacityDeletePro")
	public String storeCapacityDeletePro(String day, int storeNo) {
		storeCapacityService.delete(storeNo, day);
		return "forward:storeCapacitySelect";
	}

	@GetMapping("/storeCapacityUpdatePro")
	public String storeCapacityUpdatePro(ReservePossibleVO reservePossibleVO, Model model) {
		reservePossibleVO.setTime(String.join(",",reservePossibleVO.getTimeList()));
		model.addAttribute("storeNo", reservePossibleVO.getStoreNo());
		storeCapacityService.update(reservePossibleVO);
		return "redirect:storeCapacitySelect";
	}

	@GetMapping("/storeCapacityMonth")
	public String storeCapacityMonth(int storeNo, Model model) {
		model.addAttribute("storeNo", storeNo);
		return "/store/storeCapacityMonth";
	}

	@GetMapping("/storeCapacityMonthPro")
	public String storeCapacityMonthPro(ReservePossibleVO reservePossibleVO, Model model) {
		storeCapacityService.insertMonth(reservePossibleVO);
		model.addAttribute("storeNo", reservePossibleVO.getStoreNo());
		return "forward:storeCapacitySelect";
	}
}
