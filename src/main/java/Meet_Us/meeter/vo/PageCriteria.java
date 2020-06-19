package Meet_Us.meeter.vo;

import java.io.Serializable;

public class PageCriteria implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int page; 
	private int perPageNum; 
	private String keyword;
	private String PlaceKeyword;
	private String PurposeKeyword;
	private String DateKeyword;
	private String TitleKeyword;

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	} 

	public PageCriteria() {
		this.page = 1;
		this.perPageNum = 6;
		this.keyword = null; 
		this.PlaceKeyword = null;
		this.PurposeKeyword = null;
		this.DateKeyword = null;
		this.TitleKeyword = null;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		if (page <= 0)
			this.page = 1;
		else
			this.page = page;
	}

	public int getPerPageNum() {
		return perPageNum;
	}

	public void setPerPageNum(int pageCount) {
		int cnt = this.perPageNum;
		if (pageCount != cnt)
			this.perPageNum = cnt;
		else
			this.perPageNum = pageCount;
	}
	
	

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public String getPlaceKeyword() {
		return PlaceKeyword;
	}

	public void setPlaceKeyword(String placeKeyword) {
		PlaceKeyword = placeKeyword;
	}

	public String getPurposeKeyword() {
		return PurposeKeyword;
	}

	public void setPurposeKeyword(String purposeKeyword) {
		PurposeKeyword = purposeKeyword;
	}

	public String getDateKeyword() {
		return DateKeyword;
	}

	public void setDateKeyword(String dateKeyword) {
		DateKeyword = dateKeyword;
	}

	public String getTitleKeyword() {
		return TitleKeyword;
	}

	public void setTitleKeyword(String titleKeyword) {
		TitleKeyword = titleKeyword;
	}

	@Override
	public String toString() {
		return "PageCriteria [PlaceKeyword=" + PlaceKeyword + ", PurposeKeyword=" + PurposeKeyword + ", DateKeyword="
				+ DateKeyword + ", TitleKeyword=" + TitleKeyword + "]";
	}
}
