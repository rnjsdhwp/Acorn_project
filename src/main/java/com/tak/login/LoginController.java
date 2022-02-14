package com.tak.login;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;



@Controller
@RequestMapping(value="login")
public class LoginController {
	private static final Logger logger = 
			LoggerFactory.getLogger(LoginController.class);
	
	@Autowired ILoginService iLoginserv;
	private final int  LOGINSUCC = 1;
	
	@RequestMapping(value="loginProc")
	public String loginProc(Model model, Login login) {
		int loginResult = iLoginserv.loginProc(login);
		
		if(loginResult == LOGINSUCC) {
			return "forward:/index?formPath=home";
		}
		
		return "forward:/index?formPath=login";
	}
	
	@RequestMapping(value="logoutProc")
	public String logoutProc() {
		
		iLoginserv.logoutProc();
		logger.warn("로그아웃");
		return "forward:/index?formPath=home";
		
	}
	
	
}
