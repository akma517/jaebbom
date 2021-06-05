package com.sku.jaebbom.talent.model;

import java.util.Date;

public class TalentViewVO {
	private int talent_num;
	private String title;			// 제목 
	private int category1_num;
	private int category2_num;
	private String category1;
	private String category2;
	private String area1;
	private String area2;
	private String writer;
	private int writer_num; 
	private String matching_status;
	private String content;
	private String daytime;
	private String career;
	private String etc_career;
	private int pay;
	private Date writedate;
	private String writer_mail;
	private String univ;
	private String major;
	private String school_year;
	private String graduate;
	private String area_detail;
	private int area1_num;
	private int area2_num;
	
	public int getArea1_num() {
		return area1_num;
	}
	public void setArea1_num(int area1_num) {
		this.area1_num = area1_num;
	}
	public int getArea2_num() {
		return area2_num;
	}
	public void setArea2_num(int area2_num) {
		this.area2_num = area2_num;
	}
	public int getCategory1_num() {
		return category1_num;
	}
	public void setCategory1_num(int category1_num) {
		this.category1_num = category1_num;
	}
	public int getCategory2_num() {
		return category2_num;
	}
	public void setCategory2_num(int category2_num) {
		this.category2_num = category2_num;
	}
	public String getArea_detail() {
		return area_detail;
	}
	public void setArea_detail(String area_detail) {
		this.area_detail = area_detail;
	}
	public int getTalent_num() {
		return talent_num;
	}
	public void setTalent_num(int talent_num) {
		this.talent_num = talent_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCategory1() {
		return category1;
	}
	public void setCategory1(String category1) {
		this.category1 = category1;
	}
	public String getCategory2() {
		return category2;
	}
	public void setCategory2(String category2) {
		this.category2 = category2;
	}
	public String getArea1() {
		return area1;
	}
	public void setArea1(String area1) {
		this.area1 = area1;
	}
	public String getArea2() {
		return area2;
	}
	public void setArea2(String area2) {
		this.area2 = area2;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getWriter_num() {
		return writer_num;
	}
	public void setWriter_num(int writer_num) {
		this.writer_num = writer_num;
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
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getEtc_career() {
		return etc_career;
	}
	public void setEtc_career(String etc_career) {
		this.etc_career = etc_career;
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
	public String getWriter_mail() {
		return writer_mail;
	}
	public void setWriter_mail(String writer_mail) {
		this.writer_mail = writer_mail;
	}
	public String getUniv() {
		return univ;
	}
	public void setUniv(String univ) {
		this.univ = univ;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSchool_year() {
		return school_year;
	}
	public void setSchool_year(String school_year) {
		this.school_year = school_year;
	}
	public String getGraduate() {
		return graduate;
	}
	public void setGraduate(String graduate) {
		this.graduate = graduate;
	}
	
	@Override
	public String toString() {
		return "TalentVO [talent_num=" + talent_num + ", title=" + title + ", category1=" + category1 + ", category2="
				+ category2 + ", area1=" + area1 + ", area2=" + area2 + ", writer=" + writer + ", writer_num="
				+ writer_num + ", matching_status=" + matching_status + ", content=" + content + ", daytime=" + daytime
				+ ", career=" + career + ", etc_career=" + etc_career + ", pay=" + pay + ", writedate=" + writedate
				+ ", writer_mail=" + writer_mail + ", univ=" + univ + ", major=" + major + ", school_year="
				+ school_year + ", graduate=" + graduate + ", getClass()=" + getClass() + "]";
	}

	
	
}
