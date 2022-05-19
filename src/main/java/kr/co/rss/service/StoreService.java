package kr.co.rss.service.store;

import java.util.List;

import kr.co.rss.VO.StoreVO;

public interface StoreService {

	StoreVO select(String id);
	void update(StoreVO storeVO);
}
