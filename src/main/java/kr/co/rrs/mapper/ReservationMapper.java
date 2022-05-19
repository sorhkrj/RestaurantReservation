package kr.co.rrs.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.co.rrs.vo.ReservationVO;

public interface ReservationMapper  {
	
	//예약하기
	@Insert("insert into reservation values(RESERVENO_SEQ.NEXTVAL, #{id}, #{storNo}, #{people}, "
			+ "#{visitDay}, #{visitTime}, #{visitName}, #{visitPhone}, SYSDATE ")
	void mapperInsertRes(ReservationVO rvo);
	
	//예약수정
	@Update("update reservation set people=#{people}, visitDay=#{visitDay}, visitTime=#{visitTime}, visitName=#{visitName},"
			+ "visitPhone=#{visitPhone} where id=#{id}")
	void mapperUpdateRes(ReservationVO rvo);
	
	//가게자리증가
	@Update("update reservepossible set seat = seat + #{seat} where storeNo=#{StoreNo} and day=#{visitDay} and time=#{vistTime}")
	void mapperUpdateSeatIncrease(ReservationVO rvo);
	
	//가게자리감소
	@Update("update reservepossible set seat = seat - #{seat} where storeNo=#{StoreNo} and day=#{visitDay} and time=#{vistTime}")
	void mapperUpdateSeatDecrease(ReservationVO rvo);
	
	//예약취소
	@Delete("delete from reservation where id=#{id} and visitDay=#{visitDay} and visitTime=#{visitTime}")
	void mapperdeleteRes(ReservationVO rvo);

 // @Delete("delete from reservation where id=#{id} and visitDay=#{visitDay} and visitTime=#{visitTime}")
 //	void delete(@Param("id") String id, @Param("visitDay") String visitDay, @Param("visitTime") String visitTime );
	
	//나의 예약 리스트
	@Select("select * from reservation where id=#{id}")
	ArrayList<ReservationVO> mapperListRes(String id);
	
	//예약상세
	@Select("select * from reservation where id=#{id} and visitDay=#{visitDay} and visitTime=#{visitTime}")
	ReservationVO mapperSelectRes(ReservationVO rvo);
	
//	@Select("select * from reservation where id=${id} and visitDay=${visitDay} and visitTime=${visitTime}")
//	ReservationVO select(@Param("id") String id, @Param("visitDay") String visitDay, @Param("visitTime") String visitTime);
	
	//가입자전화번호
	@Select("select number from member where id=#{id}")
	String mapperphone(String id);
		
}
