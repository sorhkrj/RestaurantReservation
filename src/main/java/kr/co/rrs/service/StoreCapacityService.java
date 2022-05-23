package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.ReservePossibleVO;

public interface StoreCapacityService {

	List<ReservePossibleVO> selectList(int storeNo);
	ReservePossibleVO selectOne(int storeNo, String day);
	void insert(ReservePossibleVO reservePossibleVO);
	void update(ReservePossibleVO reservePossibleVO);
	void delete(int storeNo, String day);
	
	//여기서부터
	List<String[]> toArray_Times(List<ReservePossibleVO> lsc);
	String[] toArray_Time(ReservePossibleVO reservePossibleVO);
	//여기까지는 AOP로 이전되어야하는 기능
}
