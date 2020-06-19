package Meet_Us.meeter.vo;

import java.io.Serializable;

public class PushUsertokens implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private String attend_name;
	private String push_user_token;
	
	public String getAttend_name() {
		return attend_name;
	}
	public void setAttend_name(String attend_name) {
		this.attend_name = attend_name;
	}
	public String getPush_user_token() {
		return push_user_token;
	}
	public void setPush_user_token(String push_user_token) {
		this.push_user_token = push_user_token;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "PushUsertokens [attend_name=" + attend_name + ", push_user_token=" + push_user_token + "]";
	}
}
