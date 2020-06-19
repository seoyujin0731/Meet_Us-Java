package Meet_Us.board.vo;

import java.io.Serializable;

public class BoardVo implements Serializable{
	private static final long serialVersionUID = 1L;

	private int no;
	private int board_no;
	private String board_title;
	private String board_content;
	private String board_insertdate;
	private String board_modifydate;
	private int board_viewcount;
	private String user_id;
	private String board_delflag;

	public int getNo() { 
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getBoard_no() {
		return board_no;
	}

	public void setBoard_no(int board_no) {
		this.board_no = board_no;
	}

	public String getBoard_title() {
		return board_title;
	}

	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}

	public String getBoard_content() {
		return board_content;
	}

	public void setBoard_content(String board_content) {
		this.board_content = board_content;
	}

	public String getBoard_insertdate() {
		return board_insertdate;
	}

	public void setBoard_insertdate(String board_insertdate) {
		this.board_insertdate = board_insertdate;
	}

	public String getBoard_modifydate() {
		return board_modifydate;
	}

	public void setBoard_modifydate(String board_modifydate) {
		this.board_modifydate = board_modifydate;
	}

	public int getBoard_viewcount() {
		return board_viewcount;
	}

	public void setBoard_viewcount(int board_viewcount) {
		this.board_viewcount = board_viewcount;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getBoard_delflag() {
		return board_delflag;
	}

	public void setBoard_delflag(String board_delflag) {
		this.board_delflag = board_delflag;
	}

	@Override
	public String toString() {
		return "BoardVo [board_no=" + board_no + ", board_title=" + board_title + ", board_content=" + board_content
				+ ", board_insertdate=" + board_insertdate + ", board_modifydate=" + board_modifydate
				+ ", board_viewcount=" + board_viewcount + ", user_id=" + user_id + ", board_delflag=" + board_delflag
				+ "]";
	}

}
