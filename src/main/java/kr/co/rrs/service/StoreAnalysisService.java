package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.AnalysisVO;

public interface StoreAnalysisService {
	AnalysisVO getAnalysis(String id, String firstDay, String lastDay);
	public List<AnalysisVO> getTrend(String id, String firstDay, String lastDay);
}
