package kr.co.rss.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.StoreCapacityMapper;
import kr.co.rss.VO.ReservePossibleVO;
import kr.co.rss.service.store.StoreCapacityService;

@Service
public class StoreCapacityServiceImpl implements StoreCapacityService {

	@Autowired
	private StoreCapacityMapper storeCapacityMapper;

	@Override
	public void delete(String storeNo, int day) {
		storeCapacityMapper.delete(storeNo, day);
	}

	@Override
	public void insert(ReservePossibleVO reservePossibleVO) {
		storeCapacityMapper.insert(reservePossibleVO);
	}

	@Override
	public List<ReservePossibleVO> selectList(String storeNo) {
		return storeCapacityMapper.selectList(storeNo);
	}

	@Override
	public ReservePossibleVO selectOne(String storeNo, int day) {
		return storeCapacityMapper.select(storeNo, day);
	}

	@Override
	public void update(ReservePossibleVO reservePossibleVO) {
		storeCapacityMapper.update(reservePossibleVO);
	}

}
