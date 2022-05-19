package kr.co.rss.service;

import kr.co.rss.VO.StoreVO;

public interface StoreService {

	StoreVO select(String id);
	void update(StoreVO storeVO);
}
