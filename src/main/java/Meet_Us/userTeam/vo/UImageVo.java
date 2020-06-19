package Meet_Us.userTeam.vo;

import java.util.Date;

public class UImageVo{
	
	 private int seq;
	 private String user_name;
	 private String file_Name;
	 private String file_Real_Name;
	 private String file_Path;
	 private Date crt_Dt;
	 private String delFlag;
	public int getSeq() {
		return seq;
	}
	public void setSeq(int seq) {
		this.seq = seq;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
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
	public Date getCrt_Dt() {
		return crt_Dt;
	}
	public void setCrt_Dt(Date crt_Dt) {
		this.crt_Dt = crt_Dt;
	}
	public String getDelFlag() {
		return delFlag;
	}
	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}
	@Override
	public String toString() {
		return "UImageVo [seq=" + seq + ", user_name=" + user_name + ", file_Name=" + file_Name + ", file_Real_Name="
				+ file_Real_Name + ", file_Path=" + file_Path + ", crt_Dt=" + crt_Dt + ", delFlag=" + delFlag + "]";
	}
	
	 
}
