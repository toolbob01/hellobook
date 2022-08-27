package com.hellobook.utility;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

@WebListener
public class SessionConfig implements HttpSessionListener {

	private static final Map<String, HttpSession> sessions = new ConcurrentHashMap<>();

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
		sessions.put(session.getId(), session);
	}
	
	public static List<String> loginUserCheck(String user) {
		List<String> loginUserList = new ArrayList<String>();
		
		for (String key: sessions.keySet()) {
			HttpSession value = sessions.get(key);
			if (value != null && value.getAttribute("username") != null && !value.getAttribute("username").equals(user)) {
				String loginUserEmail = value.getAttribute("username").toString();
				loginUserList.add(loginUserEmail);
			}
		}
		return loginUserList;
	}

	@Override
	public void sessionCreated(HttpSessionEvent se) {
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		sessions.remove(se.getSession().getId());
		if(se.getSession().getAttribute("username") != null) {
			System.out.println("유저 ["+se.getSession().getAttribute("username")+"]님이 로그아웃 되었습니다.");
		}
	}
}
