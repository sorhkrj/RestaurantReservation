package kr.co.rrs.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletResponse;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

public interface ReservationService {

	public void insertRes(ReservationVO rvo);
	public void updateRes(ReservationVO rvo);
	public void deleteRes(int rno, String id, String password, HttpServletResponse response);
	public ArrayList<ReservationVO> listRes(String id);
	public ReservationVO selectRes(int rno);
	public MemberVO checkMember(String id);
	public ArrayList<ReservePossibleVO> checkPossibility(ReservationVO rvo);
	public StoreVO checkStore(int storeNo);
	public ArrayList<ReservePossibleVO> storeCheckPossibility(StoreVO storevo);
	public ArrayList<String> reservationTimeCheck(ReservationVO rvo);
	
}
