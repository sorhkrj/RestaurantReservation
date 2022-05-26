package kr.co.rrs.service;

import java.util.ArrayList;

import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;
import kr.co.rrs.vo.MemberVO;

public interface ReservationService {

	void insertRes(ReservationVO rvo);
	void updateRes(ReservationVO rvo);
	void deleteRes(int rno);
	ArrayList<ReservationVO> listRes(String id);
	ReservationVO selectRes(int rno);
	MemberVO checkMember(String id);
	ArrayList<ReservePossibleVO> checkPossibility(int storeNo);
	public StoreVO checkStore(int storeNo);
	ArrayList<ReservePossibleVO> storeCheckPossibility(StoreVO storevo);
	//test
	ReservePossibleVO test(String day);
	
	
}
