package kr.co.rrs.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.VO.ServiceBoardVO;
import kr.co.rrs.mapper.ServiceBoardMapper;
import kr.co.rrs.service.ServiceBoardService;
@Service
public class ServiceBoardServiceImpl implements ServiceBoardService {
	@Autowired
	ServiceBoardMapper serviceBoardMapper;

	@Override
	public void insert(ServiceBoardVO serviceBoardVO) {
		serviceBoardVO.setId("1"); // 임시 아이디
		serviceBoardVO.setViews(0); // 조회수 초기값 세팅
		serviceBoardMapper.insert(serviceBoardVO);
	}

	@Override
	public List<ServiceBoardVO> selectList() {
		List<ServiceBoardVO> list = serviceBoardMapper.selectList();
		
		return list;
	}
	
	
}
