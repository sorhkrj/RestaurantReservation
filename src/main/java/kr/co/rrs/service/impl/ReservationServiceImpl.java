package kr.co.rrs.service.impl;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.ReservationMapper;
import kr.co.rrs.service.ReservationService;
import kr.co.rrs.vo.MemberVO;
import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;

@Service
public class ReservationServiceImpl implements ReservationService {
	
	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	ReservationMapper mapper;
	
	//예약하기
	@Override
	public void insertRes(ReservationVO rvo) {
		mapper.mapperInsertRes(rvo);
	}
	
	//예약수정하기
	@Override
	public void updateRes(ReservationVO rvo) {
		mapper.mapperUpdateRes(rvo);
	}
	
    //예약취소
	@Override
	public void deleteRes(int rno, String id, String password, HttpServletResponse response) {
		
		response.setContentType("text/html; charset=UTF-8");
		if(encoder.matches(password, mapper.mapperMember(id).getPassword())) {
			mapper.mapperdeleteRes(rno);
			
		} else {
			PrintWriter out = null;
			try {
				out = response.getWriter();
			} catch (IOException e) {
				e.printStackTrace();
			}
			out.println("<script>alert('비밀번호가 일치하지 않습니다.'); </script>");
			out.flush();
		   
		}
			
	}
	
	//나의예약리스트
	@Override
	public ArrayList<ReservationVO> listRes(String id) {
		return mapper.mapperListRes(id);
	}
	
	//예약상세정보
	@Override
	public ReservationVO selectRes(int rno) {
		return mapper.mapperSelectRes(rno);
	}
	
	//비밀번호체크
	@Override
	public MemberVO checkMember(String id) {
		return mapper.mapperMember(id);
	}
	
	// 예약가능날짜시간
	@Override
	public ArrayList<ReservePossibleVO> checkPossibility(ReservationVO rvo) {
		return mapper.mapperPossibility(rvo);
	}

		
	//음식점이름
	@Override
	public StoreVO checkStore(int storeNo) {
		return mapper.mapperStore(storeNo);
	}

	@Override
	public ArrayList<ReservePossibleVO> storeCheckPossibility(StoreVO storevo) {
		return mapper.mapperStorePossibility(storevo);
	}
	
	// 예약시간체크
	@Override
	public ArrayList<String> reservationTimeCheck(ReservationVO rvo) {

		ReservePossibleVO rpvo = mapper.mapperReservationStoreTime(rvo);
		ArrayList<String> listResult = new ArrayList<String>();
		ArrayList<ReservationVO> rList = mapper.mapperReservationTime(rvo);


		//가게 예약시간을 쪼갠것
		StringTokenizer st = new StringTokenizer(rpvo.getTime(), ",");
		String[] storeSetting = new String[st.countTokens()];

		int count = st.countTokens();
		
		for(int i = 0 ; i < count ; i++)
		{
			storeSetting[i] = st.nextToken();
			listResult.add(storeSetting[i]);
		}
	
		for(int i = 0 ; i < count ; i++) {
			
			for(int j = 0; j < rList.size() ; j++)
 		    {
					 if(storeSetting[i].equals(rList.get(j).getVisitTime())) {
						  if(Integer.valueOf(rpvo.getCapacity()) <= Integer.valueOf(rList.get(j).getSumTime())) 
						  {
						  	listResult.remove(storeSetting[i]);
						  } 
					 }				
			}
 		}
		listResult.add(String.valueOf(rpvo.getSeat()));
		return listResult;
	}
}
	
	
	
	
	
	
	
	
	