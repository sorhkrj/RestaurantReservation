package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.AdminMapper;
import kr.co.rrs.service.AdminService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.StoreVO;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper mapper;

	@Override
	public List<MemberVO> searchMember(String id) {
		List<MemberVO> memberList = mapper.searchMember(id);
		return memberList;
	}

	@Override
	public List<StoreVO> searchStore(String search) {
		List<StoreVO> StoreList = mapper.searchStore(search);
		return StoreList;
	}
}
