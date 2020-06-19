package Meet_Us.meeter.vo;

import java.io.Serializable;

public class AttendUserInfo implements Serializable{
	private static final long serialVersionUID = 1L;
	
	 private String attend_name;
	 private String file_path;
	public String getAttend_name() {
		return attend_name;
	}
	public void setAttend_name(String attend_name) {
		this.attend_name = attend_name;
	}
	public String getFile_path() {
		return file_path;
	}
	public void setFile_path(String file_path) {
		this.file_path = file_path;
	}
	@Override
	public String toString() {
		return "AttendUserInfo [attend_name=" + attend_name + ", file_path=" + file_path + "]";
	}
}
