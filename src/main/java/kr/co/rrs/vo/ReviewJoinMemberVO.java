package kr.co.rrs.vo;

public class ReviewJoinMemberVO {
	private int reviewNo;
	private double rating;
	private String nickName;
	private int storeNo;
	private String reviewPhoto;
	private String reviewContent;
	private String reviewRDate;
	
	
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public double getRating() {
		return rating;
	}
	public void setRating(double rating) {
		this.rating = rating;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getReviewPhoto() {
		return reviewPhoto;
	}
	public void setReviewPhoto(String reviewPhoto) {
		this.reviewPhoto = reviewPhoto;
	}
	public String getReviewContent() {
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}
	public String getReviewRDate() {
		return reviewRDate;
	}
	public void setReviewRDate(String reviewRDate) {
		this.reviewRDate = reviewRDate;
	}
		
	
}
