package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.StoreMapper;
import kr.co.rrs.service.StoreService;
import kr.co.rrs.vo.StoreVO;

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
