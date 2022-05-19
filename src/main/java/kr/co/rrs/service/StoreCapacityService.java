package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.ReservePossibleVO;

public interface StoreCapacityService {

	List<ReservePossibleVO> selectList(int storeNo);
	ReservePossibleVO selectOne(String storeNo, int day);
	void insert(ReservePossibleVO reservePossibleVO);
	void update(ReservePossibleVO reservePossibleVO);
	void delete(String storeNo, int day);
}
