package kr.co.rrs.service;



import java.util.ArrayList;

import kr.co.rrs.vo.ReservationVO;

public interface ReservationService {

	void insertRes(ReservationVO rvo);
	void updateRes(ReservationVO rvo);
	void updateSeatIns(ReservationVO rvo);
	void updateSeatdes(ReservationVO rvo);
	void deleteRes(ReservationVO rvoe);
	ArrayList<ReservationVO> listRes(String id);
	ReservationVO selectRes(ReservationVO rvo);
	String memberPhone(String id);
	
}
