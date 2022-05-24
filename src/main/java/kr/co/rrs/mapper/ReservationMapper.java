package kr.co.rrs.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReservationVO;
import kr.co.rrs.vo.ReservePossibleVO;
import kr.co.rrs.vo.StoreVO;
import kr.co.rrs.vo.MemberVO;

public interface ReservationMapper  {
	
	//예약하기
	@Insert("insert into reservation values(RESERVENO_SEQ.NEXTVAL, #{id}, #{storeNo}, #{people}, "
			+ "#{visitDay}, #{visitTime}, #{visitName}, #{visitPhone}, SYSDATE ) ")
	void mapperInsertRes(ReservationVO rvo);
	
	//예약수정
	@Update("update reservation set people=#{people}, visitDay=#{visitDay}, visitTime=#{visitTime}, visitName=#{visitName}, "
			+ "visitPhone=#{visitPhone} where reserveNo=#{reserveNo}")
	void mapperUpdateRes(ReservationVO rvo);
		
	//예약취소
	@Delete("delete from reservation where reserveno=#{rno}")
	void mapperdeleteRes(int rno);

	//나의 예약 리스트
	@Select("select * from reservation r, store s where r.storeno = s.storeno and r.id=#{id}")
	ArrayList<ReservationVO> mapperListRes(String id);
	
	//예약상세
	@Select("select * from reservation where reserveno=#{rno}")
	ReservationVO mapperSelectRes(int rno);
	
	//가입자
	@Select("select * from member where id=#{id}")
	MemberVO mapperMember(String id);
	
	//예약가능날짜시간좌석
	@Select("select * from reservepossible where storeNo=#{storeNo} and capacity > (select count(*) from reservation where storeNO = #{storeNo} and visitTime = #{visitTime} and visitday =#{visitDay})")
	ArrayList<ReservePossibleVO> mapperPossibility(ReservationVO rvo);
	
	//음식점
	@Select("select * from store where storeNo=#{storeNo}")
	StoreVO mapperStore(int storeNo);
	
}
