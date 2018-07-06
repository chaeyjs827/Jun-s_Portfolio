package vo;

import java.util.List;

public class PageVO {
	private List<BoardVO> list; // 목록리스트 저장
	private int currentPageNo; // 현재 페이지번호
	private int perPage=10; 	// 페이지당 보여줄 갯수
	private int totalCount; // 전체 레코드 갯수
	private int fno;	// 첫번째 글 번호(perPage따라 다름)
	private String listType;	// 자주하는 질문에서 글 종류를 위해씀(페이징과 관련 X)
	private String searchWord;
	
	public String getSearchWord() {
		return searchWord;
	}
	public void setSearchWord(String searchWord) {
		this.searchWord = searchWord;
	}
	public String getListType() {
		return listType;
	}
	public void setListType(String listType) {
		this.listType = listType;
	}
	public List<BoardVO> getList() {
		return list;
	}
	public void setList(List<BoardVO> list) {
		this.list = list;
	}
	public int getCurrentPageNo() {
		return currentPageNo;
	}
	public void setCurrentPageNo(int currentPageNo) {
		this.currentPageNo = currentPageNo;
	}
	public int getPerPage() {
		return perPage;
	}
	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getFno() {
		return fno;
	}
	public void setFno(int fno) {
		this.fno = fno;
	}
	public int getLno() {
		return lno;
	}
	public void setLno(int lno) {
		this.lno = lno;
	}
	private int lno;	// 마지막 글 번호(perPage따라 다름)

	@Override
	public String toString() {
		return "PageVO [list=" + list + ", currentPageNo=" + currentPageNo + ", perPage=" + perPage + ", totalCount="
				+ totalCount + ", fno=" + fno + ", listType=" + listType + ", lno=" + lno + "]";
	}
	
}
