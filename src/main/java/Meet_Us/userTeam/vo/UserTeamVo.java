package Meet_Us.userTeam.vo;

import java.io.Serializable;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;

public class UserTeamVo implements Serializable{
	private static final long serialVersionUID = 1L;

	private String user_seq; 
	private String user_id; 
	private String user_password;
	private String user_email;
	private String user_name; 
	private int user_age;
	private char user_gender;
	private String user_defaultAddress;
	private String user_authority;
	private String user_kakaoImg;

	private boolean isAccountNonExpired;

	private boolean isAccountNonLocked;

	private boolean isCredentialsNonExpired;

	private boolean isEnabled;

	private Collection<? extends GrantedAuthority> authorities;

	public boolean isAccountNonExpired() {
		return isAccountNonExpired;
	}

	public void setAccountNonExpired(boolean isAccountNonExpired) {
		this.isAccountNonExpired = isAccountNonExpired;
	}

	public boolean isAccountNonLocked() {
		return isAccountNonLocked;
	}

	public void setAccountNonLocked(boolean isAccountNonLocked) {
		this.isAccountNonLocked = isAccountNonLocked;
	}

	public boolean isCredentialsNonExpired() {
		return isCredentialsNonExpired;
	}

	public void setCredentialsNonExpired(boolean isCredentialsNonExpired) {
		this.isCredentialsNonExpired = isCredentialsNonExpired;
	}

	public boolean isEnabled() {
		return isEnabled;
	}

	public void setEnabled(boolean isEnabled) {
		this.isEnabled = isEnabled;
	}

	public String getUser_seq() {
		return user_seq;
	}

	public void setUser_seq(String user_seq) {
		this.user_seq = user_seq;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getUser_password() {
		return user_password;
	}

	public void setUser_password(String user_password) {
		this.user_password = user_password;
	}

	public String getUser_email() {
		return user_email;
	}

	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}

	public String getUser_name() {
		return user_name;
	}

	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}

	public int getUser_age() {
		return user_age;
	}

	public void setUser_age(int user_age) {
		this.user_age = user_age;
	}

	public char getUser_gender() {
		return user_gender;
	}

	public void setUser_gender(char user_gender) {
		this.user_gender = user_gender;
	}

	public String getUser_defaultAddress() {
		return user_defaultAddress;
	}

	public void setUser_defaultAddress(String user_defaultAddress) {
		this.user_defaultAddress = user_defaultAddress;
	}

	public String getUser_authority() {
		return user_authority;
	}

	public void setUser_authority(String user_authority) {
		this.user_authority = user_authority;
	}

	public String getUser_kakaoImg() {
		return user_kakaoImg;
	}

	public void setUser_kakaoImg(String user_kakaoImg) {
		this.user_kakaoImg = user_kakaoImg;
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {
		return authorities;
	}

	public void setAuthorities(Collection<? extends GrantedAuthority> authorities) {
		this.authorities = authorities;
	}

	@Override
	public String toString() {
		return "UserTeamVo [user_seq=" + user_seq + ", user_id=" + user_id + ", user_password=" + user_password
				+ ", user_email=" + user_email + ", user_name=" + user_name + ", user_age=" + user_age
				+ ", user_gender=" + user_gender + ", user_defaultAddress=" + user_defaultAddress + ", user_authority="
				+ user_authority + ", user_kakaoImg=" + user_kakaoImg + "]";
	}

}