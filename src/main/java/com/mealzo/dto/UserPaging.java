package com.mealzo.dto;

public class UserPaging {

	private int page = 1; // 현재 화면에 표시할 페이지 번호
	private int totalCount;   // 게시물의 전체의 갯수  - 125개
	private int displayRow = 7;   //한 페이지에 몇 개의 게시물을 표시할것인가
	private int displayPage = 5;  //이전(◀)과 다음(▶) 버튼 사이에 몇 개의 페이지를 표시
	private int beginPage;    // 표시될 시작페이지 번호  1 or 11 or 21 or 31 ...
    private int endPage;      // 표시될  끝페이지 번호  10 or 20 or 30 or 40 ...
    private boolean prev;  //prev 버튼이 보일건지 안보일건지 ( true/false )
    private boolean next;  //next 버튼이 보일건지 안보일건지 ( true/false )
    private int startNum;  // 현재 페이지에 표시될 게시물 번호의 시작 번호
    private int endNum;   // 현재 페이지에 표시될 게시물 번호의 끝 번호
    
    private void paging() {
    	
    	
    	double temp = page / (double)displayPage;    
    	temp = Math.ceil(temp); // 소수점 첫자리 올림연산
    	endPage = (int)( temp * displayPage ); 
    	beginPage = endPage - (displayPage - 1);
    	int totalPage = (int)Math.ceil( totalCount / (double)displayRow);
    	if( totalPage <= endPage ) { // 총페이지가 화면에 표시할 끝페이지보다 작다면
    		endPage = totalPage; // endPage 를 총페이지수로 대체하고
    		next = false; // 다음 버튼은 표시하지 않는것으로 설정
    	} else{  // endPage 뒤로 페이지가 더 있으니. next  를 표시하는 것으로 설정
            next = true;
        }
    	prev = (beginPage==1) ? false : true;  // 시작페이지가 1인경우만 표시안함
    	
    	startNum = (page-1)*displayRow+1;   
        endNum = page*displayRow;             
        System.out.println(beginPage + " "  + endPage + " "  + startNum + " "  + endNum+ " " + totalCount);
    }
    
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		paging();  // 멤버메서드 호출 -> 각 멤버변수 구성요소를 계산해주는 메서드
	}
	public int getDisplayRow() {
		return displayRow;
	}
	public void setDisplayRow(int displayRow) {
		this.displayRow = displayRow;
	}
	public int getDisplayPage() {
		return displayPage;
	}
	public void setDisplayPage(int displayPage) {
		this.displayPage = displayPage;
	}
	public int getBeginPage() {
		return beginPage;
	}
	public void setBeginPage(int beginPage) {
		this.beginPage = beginPage;
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
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
}
