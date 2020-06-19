package Meet_Us.meeter.vo;

import java.io.Serializable;

public class MeetingBoardVo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	
	int MB_NO; 
    String MB_WRITER;
    String MB_CrtDt;
    String MB_ModiDt;
    char MB_DELFLAG;
    int MB_VIEW_COUNT;
    int MB_MEMBER;
    int MB_CURRENT_MEMBER;
    String MB_MEETING_DATE;
    String MB_MEETING_TIME;
    String MB_PURPOSE;
    String MB_PLACE;
    String MB_TITLE;
    String MB_CONTENTS;
    int MB_LIMIT_AGE_MIN;
    int MB_LIMIT_AGE_MAX;   
    String MB_LIMIT_GENDER;
    String MB_LIMIT_OTHER;
    String condition;
    String FILE_PATH;
    
	public int getMB_NO() {
		return MB_NO;
	}
	public void setMB_NO(int mB_NO) {
		MB_NO = mB_NO;
	}
	public String getMB_WRITER() {
		return MB_WRITER;
	}
	public void setMB_WRITER(String mB_WRITER) {
		MB_WRITER = mB_WRITER;
	}
	public String getMB_CrtDt() {
		return MB_CrtDt;
	}
	public void setMB_CrtDt(String mB_CrtDt) {
		MB_CrtDt = mB_CrtDt;
	}
	public String getMB_ModiDt() {
		return MB_ModiDt;
	}
	public void setMB_ModiDt(String mB_ModiDt) {
		MB_ModiDt = mB_ModiDt;
	}
	public char getMB_DELFLAG() {
		return MB_DELFLAG;
	}
	public void setMB_DELFLAG(char mB_DELFLAG) {
		MB_DELFLAG = mB_DELFLAG;
	}
	public int getMB_VIEW_COUNT() {
		return MB_VIEW_COUNT;
	}
	public void setMB_VIEW_COUNT(int mB_VIEW_COUNT) {
		MB_VIEW_COUNT = mB_VIEW_COUNT;
	}
	public int getMB_MEMBER() {
		return MB_MEMBER;
	}
	public void setMB_MEMBER(int mB_MEMBER) {
		MB_MEMBER = mB_MEMBER;
	}
	public int getMB_CURRENT_MEMBER() {
		return MB_CURRENT_MEMBER;
	}
	public void setMB_CURRENT_MEMBER(int mB_CURRENT_MEMBER) {
		MB_CURRENT_MEMBER = mB_CURRENT_MEMBER;
	}
	public String getMB_MEETING_DATE() {
		return MB_MEETING_DATE;
	}
	public void setMB_MEETING_DATE(String mB_MEETING_DATE) {
		MB_MEETING_DATE = mB_MEETING_DATE;
	}
	public String getMB_MEETING_TIME() {
		return MB_MEETING_TIME;
	}
	public void setMB_MEETING_TIME(String mB_MEETING_TIME) {
		MB_MEETING_TIME = mB_MEETING_TIME;
	}
	public String getMB_PURPOSE() {
		return MB_PURPOSE;
	}
	public void setMB_PURPOSE(String mB_PURPOSE) {
		MB_PURPOSE = mB_PURPOSE;
	}
	public String getMB_PLACE() {
		return MB_PLACE;
	}
	public void setMB_PLACE(String mB_PLACE) {
		MB_PLACE = mB_PLACE;
	}
	public String getMB_TITLE() {
		return MB_TITLE;
	}
	public void setMB_TITLE(String mB_TITLE) {
		MB_TITLE = mB_TITLE;
	}
	public String getMB_CONTENTS() {
		return MB_CONTENTS;
	}
	public void setMB_CONTENTS(String mB_CONTENTS) {
		MB_CONTENTS = mB_CONTENTS;
	}
	public int getMB_LIMIT_AGE_MIN() {
		return MB_LIMIT_AGE_MIN;
	}
	public void setMB_LIMIT_AGE_MIN(int mB_LIMIT_AGE_MIN) {
		MB_LIMIT_AGE_MIN = mB_LIMIT_AGE_MIN;
	}
	public int getMB_LIMIT_AGE_MAX() {
		return MB_LIMIT_AGE_MAX;
	}
	public void setMB_LIMIT_AGE_MAX(int mB_LIMIT_AGE_MAX) {
		MB_LIMIT_AGE_MAX = mB_LIMIT_AGE_MAX;
	}
	public String getMB_LIMIT_GENDER() {
		return MB_LIMIT_GENDER;
	}
	public void setMB_LIMIT_GENDER(String mB_LIMIT_GENDER) {
		MB_LIMIT_GENDER = mB_LIMIT_GENDER;
	}
	public String getMB_LIMIT_OTHER() {
		return MB_LIMIT_OTHER;
	}
	public void setMB_LIMIT_OTHER(String mB_LIMIT_OTHER) {
		MB_LIMIT_OTHER = mB_LIMIT_OTHER;
	}
	public String getCondition() {
		return condition;
	}
	public void setCondition(String condition) {
		this.condition = condition;
	}
	
	public String getFILE_PATH() {
		return FILE_PATH;
	}
	public void setFILE_PATH(String fILE_PATH) {
		FILE_PATH = fILE_PATH;
	}
	@Override
	public String toString() {
		return "MeetingBoardVo [MB_NO=" + MB_NO + ", MB_WRITER=" + MB_WRITER + ", MB_CrtDt=" + MB_CrtDt + ", MB_ModiDt="
				+ MB_ModiDt + ", MB_DELFLAG=" + MB_DELFLAG + ", MB_VIEW_COUNT=" + MB_VIEW_COUNT + ", MB_MEMBER="
				+ MB_MEMBER + ", MB_CURRENT_MEMBER=" + MB_CURRENT_MEMBER + ", MB_MEETING_DATE=" + MB_MEETING_DATE
				+ ", MB_MEETING_TIME=" + MB_MEETING_TIME + ", MB_PURPOSE=" + MB_PURPOSE + ", MB_PLACE=" + MB_PLACE
				+ ", MB_TITLE=" + MB_TITLE + ", MB_CONTENTS=" + MB_CONTENTS + ", MB_LIMIT_AGE_MIN=" + MB_LIMIT_AGE_MIN
				+ ", MB_LIMIT_AGE_MAX=" + MB_LIMIT_AGE_MAX + ", MB_LIMIT_GENDER=" + MB_LIMIT_GENDER
				+ ", MB_LIMIT_OTHER=" + MB_LIMIT_OTHER + ", condition=" + condition + ", FILE_PATH=" + FILE_PATH + "]";
	}
	
}
