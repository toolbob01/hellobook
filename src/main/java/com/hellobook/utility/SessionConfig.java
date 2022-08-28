package com.hellobook.utility;

import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.request;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.logging.SimpleFormatter;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

import org.springframework.web.context.annotation.SessionScope;

@WebListener
public class SessionConfig implements HttpSessionListener {

	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();
	private static final List<UserSessionVO> logoutUsers = new ArrayList<UserSessionVO>();

	public synchronized static String getSessionidCheck(String type, String compareId) {
		String result = "";
		for (String key : sessions.keySet()) {
			HttpSession value = sessions.get(key);
			if (value != null && value.getAttribute(type) != null && value.getAttribute(type).equals(compareId)) {
				result = key.toString();
				System.out.println("result : " + result);
			}
		}
		removeSessionForDoubleLogin(result);
		return result;
	}

	private static void removeSessionForDoubleLogin(String userId) {
		System.out.println("remove userId : " + userId);
		if (userId != null && userId.length() > 0) {
			sessions.get(userId).invalidate();
			sessions.remove(userId);
		}
	}
	
	public static void SessionIdCheck(HttpSession session) {
		int i = 0;
		if(logoutUsers.size() > 0) {
			for(UserSessionVO logoutUser : logoutUsers) {
				if(logoutUser.getUsername().equals(session.getAttribute("username").toString())) {
					logoutUsers.remove(i);
					break;
				}else {
					i++;
				}
			}
		}
		sessions.put(session.getId(), session);
	}
	
	public static List<UserSessionVO> loginUserCheck(String user) {
		List<UserSessionVO> loginUserList = new ArrayList<UserSessionVO>();
		
		for (String key: sessions.keySet()) {
			HttpSession value = sessions.get(key);
			//로그인 중일 때 작동
			if (value != null && value.getAttribute("username") != null && !value.getAttribute("username").equals(user)) {
				UserSessionVO usvo = new UserSessionVO();
				//로그인 중인 유저 email 저장
				usvo.setUsername(value.getAttribute("username").toString());
				
				loginUserList.add(usvo);
			}
		}
		return loginUserList;
	}
	
	public static List<UserSessionVO> LogoutUserCheck() {
		if(logoutUsers.size() >0) {
			return logoutUsers;
		}else {
			return null;
		}
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		sessions.remove(se.getSession().getId());
		if(se.getSession().getAttribute("username") != null) {
			UserSessionVO usvo = new UserSessionVO();
			//로그아웃 유저 아이디
			usvo.setUsername(se.getSession().getAttribute("username").toString());
			//로그아웃 유저 로그아웃 시간
			Date lastAccessTime = new Date(se.getSession().getLastAccessedTime());
			usvo.setLastAccessTime(lastAccessTime);
			
			logoutUsers.add(usvo);
			
			System.out.println("유저 ["+se.getSession().getAttribute("username")+"]님이 로그아웃 되었습니다.");
		}
	}
}
