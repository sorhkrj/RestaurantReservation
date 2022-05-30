package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.StoreAnalysisMapper;
import kr.co.rrs.service.StoreAnalysisService;
import kr.co.rrs.vo.AnalysisVO;

@Service
public class StoreAnalysisServiceImpl implements StoreAnalysisService {

	@Autowired
	StoreAnalysisMapper mapper;

	@Override
	public AnalysisVO getAnalysis(String id, String firstDay, String lastDay) {
		AnalysisVO avo =  mapper.countReservation(id, firstDay, lastDay);
		return avo;
	}
	
	@Override
	public List<AnalysisVO> getTrend(String id, String firstDay, String lastDay) {
		List<AnalysisVO> avoList = mapper.getTrend(id, firstDay, lastDay);
		return avoList;
	}
}
