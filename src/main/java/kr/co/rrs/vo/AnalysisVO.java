package kr.co.rrs.vo;

import java.util.List;

public class AnalysisVO {
	private int count; // 총 예약 건수
	private int people; // 일 평균 예약 건수
	private double dayAvg; // 일 평균 예약 건수
	private List<String> visitDay; // 날짜
	private List<Integer> dayCount; // 날짜별 예약 건수

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public double getDayAvg() {
		return dayAvg;
	}

	public void setDayAvg(double dayAvg) {
		this.dayAvg = dayAvg;
	}

	public List<String> getVisitDay() {
		return visitDay;
	}

	public void setVisitDay(List<String> visitDay) {
		this.visitDay = visitDay;
	}

	public List<Integer> getDayCount() {
		return dayCount;
	}

	public void setDayCount(List<Integer> dayCount) {
		this.dayCount = dayCount;
	}

}
