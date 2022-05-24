package kr.co.rrs.service.impl;

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
	public AnalysisVO getAnalysis(int storeNo, String firstDay, String lastDay) {
		AnalysisVO avo =  mapper.countReservation(storeNo, firstDay, lastDay);
		System.out.println(avo.getCount());
		System.out.println(avo.getDayAvg());
		System.out.println(avo.getPeople());
		return avo;
	}
}
