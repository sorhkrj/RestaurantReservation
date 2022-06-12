package kr.co.rrs.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.co.rrs.vo.AnalysisVO;

public interface StoreAnalysisMapper {

	// 총 예약 건수
	// 총 예약 인원
	// 일 평균 예약 건수
	@Select("select count(*) as count, sum(people) as people, count(*)/(TRUNC(TO_DATE(#{lastDay}, 'YYYY-MM-DD HH24:MI:SS')) - TRUNC(TO_DATE(#{firstDay}, 'YYYY-MM-DD HH24:MI:SS')) + 1) AS dayAvg  from reservation where storeNo =  (select storeNo from store where id = #{id}) and visitday >= TO_DATE(#{firstDay}, 'YYYY-MM-DD HH24:MI:SS') and visitday <= TO_DATE(#{lastDay}, 'YYYY-MM-DD HH24:MI:SS')")
	AnalysisVO countReservation(@Param("id") String id, @Param("firstDay") String firstDay, @Param("lastDay") String lastDay);


	// 날짜별 예약 건수
	@Select("select visitday, count(*) as dayCount from reservation where storeno = (select storeNo from store where id = #{id}) and visitday >= TO_DATE(#{firstDay}, 'YYYY-MM-DD HH24:MI:SS') and visitday <= TO_DATE(#{lastDay}, 'YYYY-MM-DD HH24:MI:SS') group by visitday")
	List<AnalysisVO> getTrend(@Param("id") String id, @Param("firstDay") String firstDay,	@Param("lastDay") String lastDay);
	/*
	 * 22-05-24 : 제수가 0입니다. 예외 처리
	 *  count(*)/decode(count(distinct visitday), 0, null, count(distinct visitday))
	 */
}

