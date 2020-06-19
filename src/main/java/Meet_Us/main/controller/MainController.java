package Meet_Us.main.controller;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import Meet_Us.main.dao.MainMapper;

import java.io.IOException;

@Controller
@EnableAutoConfiguration
@RequestMapping(value = "/*", produces = "text/plain;charset=UTF-8")
public class MainController {

	@Autowired
	private MainMapper mapper;

	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public String notification_test() throws Exception {
		return "bootstrap.notification_test";
	}
	
//	@RequestMapping(value = "/", method = RequestMethod.GET)
//	public String Home() throws Exception {
//		
//		return "bootstrap.Home";
//	}

	@RequestMapping(value = "/Map", method = RequestMethod.GET)
	public String Map() throws Exception{
      return "bootstrap.Map";
	}
	
	@RequestMapping(value = "/Developers", method = RequestMethod.GET)
	public String Developers() throws Exception{
      return "bootstrap.Developers";
	}
	

	   
}
