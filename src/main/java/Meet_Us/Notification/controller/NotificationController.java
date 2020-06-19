package Meet_Us.Notification.controller;

import java.security.Principal;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import Meet_Us.Notification.service.NotificationService;
import Meet_Us.Notification.service.firebasePushAction;


@RestController
public class NotificationController {

    Logger logger = LoggerFactory.getLogger(this.getClass());
    
    @Autowired firebasePushAction firebasepushAction;
    @Autowired NotificationService notificationService;

    @ResponseBody
    @RequestMapping(value = "/insertPushToken", method = RequestMethod.POST)
	public void insertPushToken(@RequestBody String token, Principal princial) throws Exception {
    	if(notificationService.SelectPushUser(princial.getName()) == null) {
    		//토큰 후처리 : 특수문자 변경, 토큰 끝에 '=' 붙는거 제거
        	String transToken = token.substring(0, token.length()-1);
        	transToken= transToken.replace("%3A", ":");	
        	firebasepushAction.FirstMassagePush(transToken);
        	notificationService.InsertPushUser(transToken, princial.getName());
    	}else {
    		//토큰 후처리 : 특수문자 변경, 토큰 끝에 '=' 붙는거 제거
        	String transToken = token.substring(0, token.length()-1);
        	transToken= transToken.replace("%3A", ":");	
        	firebasepushAction.FirstMassagePush(transToken);
        	notificationService.UpdatePushUser(transToken, princial.getName());
    	}
	}
    
    @ResponseBody
    @RequestMapping(value = "/DeletePushToken", method = RequestMethod.GET)
	public void DeletePushToken(Principal princial) throws Exception {
    		notificationService.DeletePushUser(princial.getName());
	}
}
