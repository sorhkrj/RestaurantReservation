package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.StoreReservationMapper;
import kr.co.rrs.service.StoreReservationService;
import kr.co.rrs.vo.ReservationVO;

@Service
public class StoreReservationServiceImpl implements StoreReservationService {

	@Autowired
	StoreReservationMapper mapper;

	@Override
	public List<ReservationVO> selectAll(int storeNo) {
		return mapper.selectAll(storeNo);
	}
	
	@Override
	public void delete(int reserveNo) {
		mapper.delete(reserveNo);
	}
}
