package kr.co.rrs.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.StringTokenizer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.rrs.mapper.StoreCapacityMapper;
import kr.co.rrs.service.StoreCapacityService;
import kr.co.rrs.vo.ReservePossibleVO;

@Service
public class StoreCapacityServiceImpl implements StoreCapacityService {

	@Autowired
	private StoreCapacityMapper storeCapacityMapper;

	@Override
	public void delete(int storeNo, String day) {
		storeCapacityMapper.delete(storeNo, day);
	}

	@Override
	public void insert(ReservePossibleVO reservePossibleVO) {
		storeCapacityMapper.insert(reservePossibleVO);
	}

	@Override
	public List<ReservePossibleVO> selectList(int storeNo) {
		return storeCapacityMapper.selectList(storeNo);
	}

	@Override
	public ReservePossibleVO selectOne(int storeNo, String day) {
		System.out.println("select원 서비스시작");
		ReservePossibleVO rvo = storeCapacityMapper.selectOne(storeNo, day);
		System.out.println("sql selectOne 결과물:" + rvo.getDay());
		return rvo;
	}

	@Override
	public void update(ReservePossibleVO reservePossibleVO) {
		storeCapacityMapper.update(reservePossibleVO);
	}

	public void insertMonth(ReservePossibleVO reservePossibleVO) {
		ArrayList<ReservePossibleVO> rvoList = new ArrayList<ReservePossibleVO>();
		Calendar cal = Calendar.getInstance();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String date;
		
		for (int i = 0; i < 30; i++) {
			cal.add(Calendar.DATE, +1);
			date = sdf.format(cal.getTime());
			ReservePossibleVO rvo = new ReservePossibleVO();
			rvo.setStoreNo(reservePossibleVO.getStoreNo());
			rvo.setDay(date);
			rvo.setTime(reservePossibleVO.getTime());
			rvo.setCapacity(reservePossibleVO.getCapacity());
			rvo.setSeat(reservePossibleVO.getSeat());
			rvoList.add(rvo);
		}
		
		for(ReservePossibleVO a : rvoList ) {
			System.out.print(a.getStoreNo() + "  ");
			System.out.print(a.getDay()  + "  ");
			System.out.print(a.getSeat()  + "  ");
			System.out.println(a.getTime());
		}
		
		storeCapacityMapper.insertMonth(rvoList);
	}

	@Override
	public List<String[]> toArray_Times(List<ReservePossibleVO> lsc) {
		List<String[]> timeList = new ArrayList<String[]>();
		for (int i = 0; i < lsc.size(); i++) {
			StringTokenizer st = new StringTokenizer(lsc.get(i).getTime(), ",");
			String[] aStrings = new String[st.countTokens()];

			int j = 0;
			while (st.hasMoreTokens()) {
				// System.out.println(st.nextToken());
				aStrings[j] = st.nextToken();
				j++;
			}
			timeList.add(aStrings);
		}
		return timeList;
	}

	@Override
	public String[] toArray_Time(ReservePossibleVO reservePossibleVO) {
		StringTokenizer st = new StringTokenizer(reservePossibleVO.getTime(), ",");
		String[] timeList = new String[st.countTokens()];
		int i = 0;
		while (st.hasMoreTokens()) {
			timeList[i] = st.nextToken();
			i++;
		}
		return timeList;
	}
}
