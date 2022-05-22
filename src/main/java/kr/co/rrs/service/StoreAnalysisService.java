package kr.co.rrs.service;

import kr.co.rrs.vo.AnalysisVO;

public interface StoreAnalysisService {
	AnalysisVO getAnalysis(int storeNo, String firstDay, String lastDay);
}
