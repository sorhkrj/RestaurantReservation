package kr.co.rrs.vo;

public class ReviewCommentVO {
	private int reviewCommentNo;
	private int reviewNo;
	private String id;
	private String reviewCommentContent;
	private String reviewCommentRDate;
	
	public int getReviewCommentNo() {
		return reviewCommentNo;
	}
	public void setReviewCommentNo(int reviewCommentNo) {
		this.reviewCommentNo = reviewCommentNo;
	}
	public int getReviewNo() {
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) {
		this.reviewNo = reviewNo;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getReviewCommentContent() {
		return reviewCommentContent;
	}
	public void setReviewCommentContent(String reviewCommentContent) {
		this.reviewCommentContent = reviewCommentContent;
	}
	public String getReviewCommentRDate() {
		return reviewCommentRDate;
	}
	public void setReviewCommentRDate(String reviewCommentRDate) {
		this.reviewCommentRDate = reviewCommentRDate;
	}
	
}
