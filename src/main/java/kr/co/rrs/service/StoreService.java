package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.VO.StoreVO;

public interface StoreService {

	StoreVO select(String id);
	void update(StoreVO storeVO);
}
