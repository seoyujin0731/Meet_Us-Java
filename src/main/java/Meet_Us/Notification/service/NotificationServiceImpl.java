package Meet_Us.Notification.service;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Meet_Us.Notification.dao.NotificationMapper;

@Service
public class NotificationServiceImpl implements NotificationService {
   
   @Autowired
   private NotificationMapper mapper;
   
  
   // 구독 등록
   @Override
   public void InsertPushUser(String token, String name) {
	   HashMap<String, String> map = new HashMap<String, String>();
	   map.put("token", token);
	   map.put("name", name);
	   mapper.InsertPushUser(map);
   }
   
   // 한번이라도 구독한 유저 조회
   @Override
   public String SelectPushUser(String name) {
	   return mapper.SelectPushUser(name);
   }
   
   // 구독 중인 유저 조회
   public String SelectPushUserActice(String name) {
	   return mapper.SelectPushUserActice(name);
   }
   
   // 이전 구독 삭제
   @Override
   public void DeletePushUser(String name) {
	   mapper.DeletePushUser(name);
   }
   
   // 재구독 
   @Override
   public void UpdatePushUser(String token, String name) {
	   HashMap<String, String> map = new HashMap<String, String>();
	   map.put("token", token);
	   map.put("name", name);
	   mapper.UpdatePushUser(map);
   }
}