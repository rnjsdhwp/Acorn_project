package com.tak.login;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService{
	private static final Logger logger = LoggerFactory.getLogger(LoginServiceImpl.class);
	@Autowired private ILoginDAO iLoginDao;
	@Autowired private HttpSession session;
	private final int LOGINSUCC = 1;
	@Override
	public int loginProc(Login login) {
		
		
		int loginResult = iLoginDao.loginProc(login);
		setSession(loginResult, login.getId());
		
		logger.warn("loginResult = " + loginResult + " loginID = " + login.getId());
		return loginResult;
	}
	
	private void setSession(int loginResult, String id) {
		if(loginResult == LOGINSUCC) {
			session.setAttribute("id", id);
		}
	}

	@Override
	public void logoutProc() {
		session.invalidate();
		
	}


}
