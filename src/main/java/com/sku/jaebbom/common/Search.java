package com.sku.jaebbom.common;

public class Search extends Paging {
	private String searchType;
	private String keyword;
	private int category1_num;
	private int category2_num;
	private int area1_num;
	private int area2_num;
	
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
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
	@Override
	public String toString() {
		return "Search [searchType=" + searchType + ", keyword=" + keyword + ", category1_num=" + category1_num
				+ ", category2_num=" + category2_num + ", area1_num=" + area1_num + ", area2_num=" + area2_num + "]";
	}
	
	
}
