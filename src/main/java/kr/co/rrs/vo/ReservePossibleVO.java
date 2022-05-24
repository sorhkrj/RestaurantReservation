package kr.co.rrs.vo;

public class ReservePossibleVO {
	private int storeNo;
	private String day;
	private String time;
	private int capacity;
	private int seat;
	private String[] timeList; //배열-문자열 전환 과정에서 필요.
	
	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public int getCapacity() {
		return capacity;
	}

	public void setCapacity(int capacity) {
		this.capacity = capacity;
	}

	public int getSeat() {
		return seat;
	}

	public void setSeat(int seat) {
		this.seat = seat;
	}

	public String[] getTimeList() {
		return timeList;
	}

	public void setTimeList(String[] timeList) {
		this.timeList = timeList;
	}
	
}
