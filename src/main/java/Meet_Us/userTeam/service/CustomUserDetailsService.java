package Meet_Us.userTeam.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import Meet_Us.userTeam.dao.UserTeamMapper;
import Meet_Us.userTeam.vo.UserTeamVo;

@Service
public class CustomUserDetailsService implements UserDetailsService {

	private static final String ROLE_PREFIX = "ROLE_";

	@Autowired
	UserTeamMapper userMapper;

	@Override
	public UserDetails loadUserByUsername(String user_id) throws UsernameNotFoundException {

		UserTeamVo member = userMapper.readUser(user_id);
		if (member != null) {
			member.setAuthorities(makeGrantedAuthority(userMapper.readAuthority(user_id)));
		}
		
		return new SecurityMember(member);
	}

	private static List<GrantedAuthority> makeGrantedAuthority(List<String> roles) {
		List<GrantedAuthority> list = new ArrayList<>();
		roles.forEach(role -> list.add(new SimpleGrantedAuthority(ROLE_PREFIX + role)));
//		roles.forEach(role -> list.add(new SimpleGrantedAuthority(role)));
		System.out.println(list);
		return list;
	}

}
