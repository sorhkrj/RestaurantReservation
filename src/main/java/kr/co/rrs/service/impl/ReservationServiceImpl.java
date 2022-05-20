package kr.co.rrs.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ReservationMapper;
import kr.co.rrs.service.ReservationService;
import kr.co.rrs.vo.ReservationVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	ReservationMapper mapper;
	
	//예약하기
	@Override
	public void insertRes(ReservationVO rvo) {
		mapper.mapperInsertRes(rvo);
	}
	//예약수정하기
	@Override
	public void updateRes(ReservationVO rvo) {
		mapper.mapperUpdateRes(rvo);
	}
    //
	@Override
	public void deleteRes(int rno) {
		mapper.mapperdeleteRes(rno);
	}
	//
	@Override
	public ArrayList<ReservationVO> listRes(String id) {
		return mapper.mapperListRes(id);
	}

	@Override
	public ReservationVO selectRes(int rno) {
		return mapper.mapperSelectRes(rno);
	}

	@Override
	public String memberPhone(String id) {
		return mapper.mapperphone(id);
	}

	@Override
	public void updateSeatIns(ReservationVO rvo) {
		mapper.mapperUpdateSeatIncrease(rvo);
	}

	@Override
	public void updateSeatdes(ReservationVO rvo) {
		mapper.mapperUpdateSeatDecrease(rvo);
	}

	
}