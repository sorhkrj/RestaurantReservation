package kr.co.rrs.service;

import java.util.List;

import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

public interface AdminService {
	
	List<MemberVO> searchMember(String id);
	List<StoreVO> searchStore(String search);
	StoreVO getStore(int storeNo);
	MemberVO getMember(String id);
	boolean memberRecoveryAdmin(String id);
}
