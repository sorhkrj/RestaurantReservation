package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.ReservePossibleVO;

public interface StoreCapacityService {

	List<ReservePossibleVO> selectList(int storeNo);
	ReservePossibleVO selectOne(int storeNo, String day);
	void insert(ReservePossibleVO reservePossibleVO);
	void update(ReservePossibleVO reservePossibleVO);
	void delete(int storeNo, String day);
	public void insertMonth(ReservePossibleVO reservePossibleVO);
	
	
	List<String[]> toArray_Times(List<ReservePossibleVO> lsc);
	String[] toArray_Time(ReservePossibleVO reservePossibleVO);
}
