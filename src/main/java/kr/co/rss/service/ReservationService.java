package kr.co.rss.service;



import java.util.ArrayList;

import kr.co.rss.VO.ReservationVO;

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
