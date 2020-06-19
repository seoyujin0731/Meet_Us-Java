package Meet_Us.Notification.dao;

import java.util.HashMap;

import org.springframework.stereotype.Repository; 

@Repository
public interface NotificationMapper {
	// 구독 등록
	public void InsertPushUser(HashMap<String, String> map);
	
	// 한번이라도 구독한 유저 조회
	public String SelectPushUser(String name);
	
	// 구독 중인 유저 조회
	public String SelectPushUserActice(String name);
	
	// 이전 구독 삭제
	public void DeletePushUser(String name);
	
	// 재구독 
	public void UpdatePushUser(HashMap<String, String> map);

}