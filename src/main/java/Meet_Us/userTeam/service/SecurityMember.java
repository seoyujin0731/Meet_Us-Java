package Meet_Us.userTeam.service;

import org.springframework.security.core.userdetails.User;

import Meet_Us.userTeam.vo.UserTeamVo;

public class SecurityMember extends User {

	private static final long serialVersionUID = 1L;

	private String ip;

	public SecurityMember(UserTeamVo member) {
		super(member.getUser_name(), member.getUser_password(), member.getAuthorities());
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

}
