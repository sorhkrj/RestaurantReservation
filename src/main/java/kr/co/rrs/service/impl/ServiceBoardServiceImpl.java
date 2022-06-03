package kr.co.rrs.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ServiceBoardMapper;
import kr.co.rrs.service.ServiceBoardService;
import kr.co.rrs.vo.ReplyVO;
import kr.co.rrs.vo.ServiceBoardVO;
@Service
public class ServiceBoardServiceImpl implements ServiceBoardService {
	@Autowired
	ServiceBoardMapper serviceBoardMapper;

	@Override
	public void insert(ServiceBoardVO serviceBoardVO, HttpSession session, String id) {
		String nickName = (String) session.getAttribute("nickName");
		serviceBoardVO.setId(id); // 아이디
		serviceBoardVO.setNickName(nickName); // 닉네임
		serviceBoardVO.setViews(1); // 조회수 초기값 세팅
		serviceBoardMapper.insert(serviceBoardVO); // 문의글 등록
	}

	@Override
	public List<ServiceBoardVO> selectList(int startBoard, int endBoard) {
		return serviceBoardMapper.selectList(startBoard, endBoard); // 전체 문의글 목록
	}

	@Override
	public ServiceBoardVO selectDetail(int serviceNo) {
		return serviceBoardMapper.selectDetail(serviceNo); // 문의글 상세보기
	}

	@Override
	public void updateViews(int serviceNo, String id) {
		serviceBoardMapper.updateViews(serviceNo, id); // 조회수 증가
	}

	@Override
	public ReplyVO selectReply(int serviceNo) {
		return serviceBoardMapper.selectReply(serviceNo); // 문의글 번호에 해당하는 답변 불러오기
	}

	@Override
	public void update(int serviceNo, String title, String content) {
		serviceBoardMapper.update(serviceNo, title, content);
	}

	@Override
	public void delete(int serviceNo) {
		serviceBoardMapper.delete(serviceNo);
	}

	@Override
	public int selectServiceBoardTotal() {
		return serviceBoardMapper.selectServiceBoardTotal();
	}
	
	//-------------------------------------------------------------
	public void serviceBoardUpdateCheck(HttpServletResponse response) {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = null;
		try {
			out = response.getWriter();
		} catch (IOException e) {
			e.printStackTrace();
		}
		out.println("<script>alert('비밀번호가 틀립니다. 수정할 수 없습니다.'); </script>");
		out.flush();
	}

}
