package Meet_Us.meeter.vo;

import java.io.Serializable;

public class MeetBoardReplyVo implements Serializable{
	private static final long serialVersionUID = 1L;
	
   private int mb_no;
   private int board_reply_no;
   private String board_reply_writer;
   private String board_reply_content;
   private String board_reply_insertdate;
   private String board_reply_updatedate;
   private String board_reply_deflag;
   private String file_path;
   
public int getMb_no() {
	return mb_no;
}
public void setMb_no(int mb_no) {
	this.mb_no = mb_no;
}
public int getBoard_reply_no() {
	return board_reply_no;
}
public void setBoard_reply_no(int board_reply_no) {
	this.board_reply_no = board_reply_no;
}
public String getBoard_reply_writer() {
	return board_reply_writer;
}
public void setBoard_reply_writer(String board_reply_writer) {
	this.board_reply_writer = board_reply_writer;
}
public String getBoard_reply_content() {
	return board_reply_content;
}
public void setBoard_reply_content(String board_reply_content) {
	this.board_reply_content = board_reply_content;
}
public String getBoard_reply_insertdate() {
	return board_reply_insertdate;
}
public void setBoard_reply_insertdate(String board_reply_insertdate) {
	this.board_reply_insertdate = board_reply_insertdate;
}
public String getBoard_reply_updatedate() {
	return board_reply_updatedate;
}
public void setBoard_reply_updatedate(String board_reply_updatedate) {
	this.board_reply_updatedate = board_reply_updatedate;
}
public String getBoard_reply_deflag() {
	return board_reply_deflag;
}
public void setBoard_reply_deflag(String board_reply_deflag) {
	this.board_reply_deflag = board_reply_deflag;
}
public String getFile_path() {
	return file_path;
}
public void setFile_path(String file_path) {
	this.file_path = file_path;
}
public static long getSerialversionuid() {
	return serialVersionUID;
}
@Override
public String toString() {
	return "MeetBoardReplyVo [mb_no=" + mb_no + ", board_reply_no=" + board_reply_no + ", board_reply_writer="
			+ board_reply_writer + ", board_reply_content=" + board_reply_content + ", board_reply_insertdate="
			+ board_reply_insertdate + ", board_reply_updatedate=" + board_reply_updatedate + ", board_reply_deflag="
			+ board_reply_deflag + ", file_path=" + file_path + "]";
}

  

}