package kr.co.rrs.service;

import kr.co.rrs.vo.StoreVO;

public interface StoreService {

	StoreVO select(String id);
	void update(StoreVO storeVO);
}
