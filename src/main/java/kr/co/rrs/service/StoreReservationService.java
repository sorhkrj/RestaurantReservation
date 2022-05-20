package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;

public interface StoreReservationService {

	List<ReservationVO> selectAll(int storeNo);
	void delete(int reserveNo);

}
