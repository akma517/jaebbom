package com.sku.jaebbom.notice.model;

public class NoticeVO {
	private int notice_num;
	private int writer_num;
	private String writer;
	private String title;
	private String content;
	private String write_date;
	public int getNotice_num() {
		return notice_num;
	}
	public void setNotice_num(int notice_num) {
		this.notice_num = notice_num;
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
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	
	@Override
	public String toString() {
		return "NoticeVO [notice_num=" + notice_num + ", writer_num=" + writer_num + ", writer=" + writer + ", title="
				+ title + ", content=" + content + ", write_date=" + write_date + "]";
	}	
	
}
