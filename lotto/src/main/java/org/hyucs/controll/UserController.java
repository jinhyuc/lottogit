package org.hyucs.controll;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/user/*")
public class UserController {
	private static final Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value="login", method=RequestMethod.GET)
	public void loginGET() {
		
	}
	
	@RequestMapping(value="regist", method=RequestMethod.GET)
	public void registrationGET() {
		
	}
	
	@RequestMapping(value="regist", method=RequestMethod.POST)
	public void registrationPOST() {
		
	}

}