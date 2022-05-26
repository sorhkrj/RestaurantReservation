package kr.co.rrs.vo;

public class ReviewLikeVO {
	private int reviewLikeNo;
	private int storeNo;
	private String id;
	private int sw = 0;
	private int reviewLikeCnt = 0;
	private int likeStatus;
	
	
	public int getReviewLikeNo() {
		return reviewLikeNo;
	}
	public void setReviewLikeNo(int reviewLikeNo) {
		this.reviewLikeNo = reviewLikeNo;
	}
	public int getStoreNo() {
		return storeNo;
	}
	public void setStoreNo(int storeNo) {
		this.storeNo = storeNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSw() {
		return sw;
	}
	public void setSw(int sw) {
		this.sw = sw;
	}
	public int getReviewLikeCnt() {
		return reviewLikeCnt;
	}
	public void setReviewLikeCnt(int reviewLikeCnt) {
		this.reviewLikeCnt = reviewLikeCnt;
	}
	public int getLikeStatus() {
		return likeStatus;
	}
	public void setLikeStatus(int likeStatus) {
		this.likeStatus = likeStatus;
	}
	
}
