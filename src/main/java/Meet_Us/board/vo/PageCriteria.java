package Meet_Us.board.vo;

import java.io.Serializable;

public class PageCriteria implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private int page; 
	private int perPageNum; 
	private String keyword; 

	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}

	public PageCriteria() {
		this.page = 1;
		this.perPageNum = 10;
		this.keyword = null; 
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

}
