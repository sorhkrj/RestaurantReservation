package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.AnalysisVO;

public interface StoreAnalysisMapper {

	// 총 예약 건수
	// 총 예약 인원
	// 일 평균 예약 건수
	@Select("select count(*) as count, sum(people) as people, count(*)/count(distinct visitday) as dayAvg from reservation where storeNo =  #{storeNo} and visitday >= TO_DATE(#{firstDay}, 'YYYY-MM-DD HH24:MI:SS') and visitday <= TO_DATE(#{lastDay}, 'YYYY-MM-DD HH24:MI:SS')")
	AnalysisVO countReservation(@Param("storeNo") int storeNo, @Param("firstDay") String firstDay, @Param("lastDay") String lastDay);

	// 날짜별 예약 건수
//	@Select("select visitday, count(*) as dayCount from reservation where storeno = #{storeNo} and visitday >= TO_DATE(#{firstDay}, 'YYYY-MM-DD HH24:MI:SS') and visitday <= TO_DATE(#{lastDay}, 'YYYY-MM-DD HH24:MI:SS') group by visitday")
//	List<AnalysisVO> getTrend(@Param("storeNo") int storeNo, @Param("firstDay") String firstDay,	@Param("lastDay") String lastDay);

}
