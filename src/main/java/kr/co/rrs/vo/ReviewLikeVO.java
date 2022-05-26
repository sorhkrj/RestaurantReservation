package kr.co.rrs.vo;

public class ReviewLikeVO {
	private int reviewLikeNo;
	private int storeNo;
	private String id;
	private int sw = 0;
	private int reivewLikeCnt = 0;
	
	
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
	public int getReivewLikeCnt() {
		return reivewLikeCnt;
	}
	public void setReivewLikeCnt(int reivewLikeCnt) {
		this.reivewLikeCnt = reivewLikeCnt;
	}
	
}
