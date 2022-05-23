package kr.co.rrs.service.impl;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ReservationMapper;
import kr.co.rrs.service.ReservationService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

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
    //예약취소
	@Override
	public void deleteRes(int rno) {
		mapper.mapperdeleteRes(rno);
	}
	//나의예약리스트
	@Override
	public ArrayList<ReservationVO> listRes(String id) {
		return mapper.mapperListRes(id);
	}
	//예약상세정보
	@Override
	public ReservationVO selectRes(int rno) {
		return mapper.mapperSelectRes(rno);
	}
	//비밀번호체크
	@Override
	public MemberVO checkMember(String id) {
		
		return mapper.mapperMember(id);
	}
	
	@Override
	public ArrayList<ReservePossibleVO> checkPossibility(int storeNo) {
		
		return mapper.mapperPossibility(storeNo);
	}
	
}