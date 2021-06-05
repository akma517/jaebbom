package com.sku.jaebbom.talent.model;

import java.util.Date;

public class TalentVO {
	private int talent_num;
	private int talent_category1_num;
	private int talent_category2_num;
	private int area1;
	private int area2;
	private String area_detail;
	private String title;
	private int writer; 
	private String matching_status;
	private String content;
	private String daytime;
	private int career;
	private int pay;
	private Date writedate;
	
	public int getTalent_num() {
		return talent_num;
	}
	public void setTalent_num(int talent_num) {
		this.talent_num = talent_num;
	}
	public int getTalent_category1_num() {
		return talent_category1_num;
	}
	public void setTalent_category1_num(int talent_category1_num) {
		this.talent_category1_num = talent_category1_num;
	}
	public int getTalent_category2_num() {
		return talent_category2_num;
	}
	public void setTalent_category2_num(int talent_category2_num) {
		this.talent_category2_num = talent_category2_num;
	}
	public int getArea1() {
		return area1;
	}
	public void setArea1(int area1) {
		this.area1 = area1;
	}
	public int getArea2() {
		return area2;
	}
	public void setArea2(int area2) {
		this.area2 = area2;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getWriter() {
		return writer;
	}
	public void setWriter(int writer) {
		this.writer = writer;
	}
	public String getMatching_status() {
		return matching_status;
	}
	public void setMatching_status(String matching_status) {
		this.matching_status = matching_status;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getDaytime() {
		return daytime;
	}
	public void setDaytime(String daytime) {
		this.daytime = daytime;
	}
	public int getCareer() {
		return career;
	}
	public void setCareer(int career) {
		this.career = career;
	}
	public int getPay() {
		return pay;
	}
	public void setPay(int pay) {
		this.pay = pay;
	}
	public Date getWritedate() {
		return writedate;
	}
	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}
	public String getArea_detail() {
		return area_detail;
	}
	public void setArea_detail(String area_detail) {
		this.area_detail = area_detail;
	}

	
	@Override
	public String toString() {
		return "TalentVO [talent_num=" + talent_num + ", talent_category1_num=" + talent_category1_num
				+ ", talent_category2_num=" + talent_category2_num + ", area1=" + area1 + ", area2=" + area2
				+ ", title=" + title + ", writer=" + writer + ", matching_status=" + matching_status + ", content="
				+ content + ", daytime=" + daytime + ", career=" + career + ", pay=" + pay + ", writedate=" + writedate
				+ ", getClass()=" + getClass() + "]";
	}
	
	
	
	
}
