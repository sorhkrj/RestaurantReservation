package kr.co.rss.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.StoreMapper;
import kr.co.rss.VO.StoreVO;
import kr.co.rss.service.store.StoreService;

@Service
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreMapper storeMapper;

	@Override
	public StoreVO select(String id) {
		return storeMapper.select(id);
	}

	@Override
	public void update(StoreVO storeVO) {
		storeMapper.update(storeVO);
	}
}
