package com.sku.jaebbom.common;

public class Paging {
	
	private int listSize = 6;			//페이지당 재능 개수	
	private int rangeSize = 10;			//한 페이지 범위의 개수
	private int page;					//현재 목록의 페이지 번호
	private int range;					//각 페이지 범위 시작 번호
	private int listCnt;				//전체 개시물 개수
	private int startPage;				//각 페이지 범위 시작 번호
	private int startList;				//게시판 시작 번호
	private int endPage;				//각 페이지 범위 끝 번호
	private boolean prev;				//이전 페이지 여부
	private boolean next;				//다음 페이지 여부
	private int pageCnt;				//전체 페이지 범위의 개수

	public int getListSize() {
		return listSize;
	}
	
	public void setListSize(int listSize) {
		this.listSize = listSize;
	}
	
	public int getRangeSize() {
		return rangeSize;
	}
	
	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int page) {
		this.page = page;
	}
	
	public int getListCnt() {
		return listCnt;
	}
	
	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	
	public int getStartList() {
		return startList;
	}
	
	public void setStartList(int startList) {
		this.startList = startList;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public void setNext(boolean next) {
		this.next = next;
	}
	
	public int getRange() {
		return range;
	}

	public void setRange(int range) {
		this.range = range;
	}
	
	

	public int getPageCnt() {
		return pageCnt;
	}

	public void setPageCnt(int pageCnt) {
		this.pageCnt = pageCnt;
	}

	public void pageInfo(int page, int range, int listCnt) {
		this.page = page;
		this.range = range;
		this.listCnt = listCnt;
		
		// 전체 페이지 수
		this.pageCnt = (int) Math.ceil((double)listCnt/listSize);
		
		this.startPage = (range - 1) * rangeSize + 1;
		
		this.endPage = range * rangeSize;
		
		if (page == 1) {
			this.startList = 1;
		} else {
			this.startList = ((page-1) * listSize)+1;
		}

		this.prev = range == 1? false : true;
		
		this.next = pageCnt > endPage ? false : true;
		
		if (this.endPage > this.pageCnt) {
			this.endPage = this.pageCnt;
			this.next = false;
		}
	}
	
}
