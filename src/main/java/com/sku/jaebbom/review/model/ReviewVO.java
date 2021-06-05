package com.sku.jaebbom.review.model;

public class ReviewVO {
	private int review_num;
	private int talent_num;
	private int writer_num;
	private String writer;
	private String content;
	private String write_date;
	private int score;
	
	
	
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public int getReview_num() {
		return review_num;
	}
	public void setReview_num(int review_num) {
		this.review_num = review_num;
	}
	public int getTalent_num() {
		return talent_num;
	}
	public void setTalent_num(int talent_num) {
		this.talent_num = talent_num;
	}
	public int getWriter_num() {
		return writer_num;
	}
	public void setWriter_num(int writer_num) {
		this.writer_num = writer_num;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrite_date() {
		return write_date;
	}
	public void setWrite_date(String write_date) {
		this.write_date = write_date;
	}
	
}
