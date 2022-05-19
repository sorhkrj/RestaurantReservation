package kr.co.rss.service;

import java.util.List;

import kr.co.rss.VO.ReservePossibleVO;

public interface StoreCapacityService {

	List<ReservePossibleVO> selectList(String storeNo);
	ReservePossibleVO selectOne(String storeNo, int day);
	void insert(ReservePossibleVO reservePossibleVO);
	void update(ReservePossibleVO reservePossibleVO);
	void delete(String storeNo, int day);
}
