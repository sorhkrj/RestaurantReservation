package kr.co.rrs.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.MemberMapper;
import kr.co.rrs.service.MemberService;
import kr.co.rrs.vo.EnterpriseVO;
import kr.co.rrs.vo.MemberVO;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;

	@Override
	public void insert(MemberVO memberVO) {
		memberMapper.insert(memberVO);
	}

	@Override
	public MemberVO selectOne(String id) {
		return memberMapper.selectOne(id);
	}
	@Override
	public void delete(String id, String password) {
		System.out.println("service : "+id);
		memberMapper.delete(id, password);
		
		
	}
	@Override
	public void Update(MemberVO memberVO) {
		memberMapper.Update(memberVO);
		
	}

	@Override
	public void insertEnterprise(EnterpriseVO enterpriseVO) {
		System.out.println(enterpriseVO.getId());
		System.out.println(enterpriseVO.getCategory());
		System.out.println(enterpriseVO.getHolyday());
		System.out.println(enterpriseVO.getIntroduce());
		System.out.println(enterpriseVO.getLocation());
		System.out.println(enterpriseVO.getMemberLevel());//
		System.out.println(enterpriseVO.getName());
		System.out.println(enterpriseVO.getNickname());
		System.out.println(enterpriseVO.getNotice());
		System.out.println(enterpriseVO.getParking());
		System.out.println(enterpriseVO.getPassword());
		System.out.println(enterpriseVO.getPhone());//
		System.out.println(enterpriseVO.getPhoto());
		System.out.println(enterpriseVO.getRegDate());//
		System.out.println(enterpriseVO.getStore_phone());
		System.out.println(enterpriseVO.getStoreName());
		System.out.println(enterpriseVO.getStoreNo());//
		memberMapper.insert2(enterpriseVO);
		memberMapper.insertEnterprise(enterpriseVO);
	}


}
