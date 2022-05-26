package kr.co.rrs.vo;

import java.sql.Date;

public class ReviewVO {
	private int reviewNo;
	private double rating;
	private String reviewNickName;
	private int storeNo;
	private String reviewPhoto;
	private String reviewContent;
	private Date reviewRDate;
	
	
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
	public String getReviewNickName() {
		return reviewNickName;
	}
	public void setReviewNickName(String reviewNickName) {
		this.reviewNickName = reviewNickName;
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
	public Date getReviewRDate() {
		return reviewRDate;
	}
	public void setReviewRDate(Date reviewRDate) {
		this.reviewRDate = reviewRDate;
	}
	
	
}
