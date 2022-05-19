package kr.co.rrs.vo;

public class ReservationVO {
	private int reserveNo;
	private String id;
	private int storeNo;
	private int people;
	private String visitDay;
	private String visitName;
	private String visitPhone;
	private String regDate;

	public int getReserveNo() {
		return reserveNo;
	}

	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getStoreNo() {
		return storeNo;
	}

	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	public String getVisitDay() {
		return visitDay;
	}

	public void setVisitDay(String visitDay) {
		this.visitDay = visitDay;
	}

	public String getVisitName() {
		return visitName;
	}

	public void setVisitName(String visitName) {
		this.visitName = visitName;
	}

	public String getVisitPhone() {
		return visitPhone;
	}

	public void setVisitPhone(String visitPhone) {
		this.visitPhone = visitPhone;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

}
