package Meet_Us.board.vo;

import java.io.Serializable;
import java.util.Date;

public class FileVo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	 private int seq;
	 private int up_Seq;
	 private String file_Name;
	 private String file_Real_Name;
	 private String file_Path;
	 private int down_Cnt;
	 private Date crt_Dt;
	 private Date last_Dt;
	 private String delFlag;
	 
	public int getSeq() { 
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	
	public int getUp_Seq() {
		return up_Seq;
	}
	public void setUp_Seq(int up_Seq) {
		this.up_Seq = up_Seq;
	}
	public String getFile_Name() {
		return file_Name;
	}
	public void setFile_Name(String file_Name) {
		this.file_Name = file_Name;
	}
	public String getFile_Real_Name() {
		return file_Real_Name;
	}
	public void setFile_Real_Name(String file_Real_Name) {
		this.file_Real_Name = file_Real_Name;
	}
	public String getFile_Path() {
		return file_Path;
	}
	public void setFile_Path(String file_Path) {
		this.file_Path = file_Path;
	}
	public int getDown_Cnt() {
		return down_Cnt;
	}
	public void setDown_Cnt(int down_Cnt) {
		this.down_Cnt = down_Cnt;
	}
	public Date getCrt_Dt() {
		return crt_Dt;
	}
	public void setCrt_Dt(Date crt_Dt) {
		this.crt_Dt = crt_Dt;
	}
	public Date getLastDt() {
		return last_Dt;
	}
	public void setLas_tDt(Date las_tDt) {
		this.last_Dt = las_tDt;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	@Override
	public String toString() {
		return "FileVo [seq=" + seq + ", up_Seq=" + up_Seq + ", file_Name=" + file_Name + ", file_Real_Name="
				+ file_Real_Name + ", file_Path=" + file_Path + ", down_Cnt=" + down_Cnt + ", crt_Dt=" + crt_Dt
				+ ", las_tDt=" + last_Dt + ", delFlag=" + delFlag + "]";
	}
	

}
