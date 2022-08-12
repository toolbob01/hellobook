package com.hellobook.auth;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

import lombok.extern.log4j.Log4j;

@Log4j
@Component
public class NaverLoginBO {

	/* 인증 요청문을 구성하는 파라미터 */
	//client_id: 애플리케이션 등록 후 발급받은 클라이언트 아이디
	//response_type: 인증 과정에 대한 구분값. code로 값이 고정돼 있습니다.
	//redirect_uri: 네이버 로그인 인증의 결과를 전달받을 콜백 URL(URL 인코딩). 애플리케이션을 등록할 때 Callback URL에 설정한 정보입니다.
	//state: 애플리케이션이 생성한 상태 토큰
	
	private final static String CLIENT_ID = "L7X1ca1NHWDatgd24kLv";
	private final static String CLIENT_SECRET = "8bMD_R8_Mv";
	private final static String REDIRECT_URI = "http://localhost:8080/member/memberNaverLogin";
	private final static String SESSION_STATE = "oauth_state";
	/* 프로필 조회 API URL */
	private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	/* 세션 유효성 검증을 위한 난수 생성기 */
	private String generateRandomString() {
		return UUID.randomUUID().toString();
	}
 
	/* http session에 데이터 저장 */
	private void setSession(HttpSession session,String state){
		session.setAttribute(SESSION_STATE, state);     
	}
 
	/* http session에서 데이터 가져오기 */ 
	private String getSession(HttpSession session){
		return (String) session.getAttribute(SESSION_STATE);
	}
	
	//네이버 아이디로 인증 URL 생성 Method
	public String getAuthorizaionUrl(HttpSession session) {
		/* 세션 유효성 검증을 위하여 난수를 생성 */
		String state = generateRandomString();
		/* 생성한 난수 값을 session에 저장 */
		setSession(session,state);
		
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.state(state)
				.build(NaverLoginApi.instance());
		return oauthService.getAuthorizationUrl();
	}
	
	/* 네이버아이디로 Callback 처리 및  AccessToken 획득 Method */
	public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws Exception{
		String sessionState = getSession(session);
		System.out.println("sesssionState: "+sessionState);
		System.out.println("state: "+state);
		if(StringUtils.pathEquals(sessionState, state)) {
			OAuth20Service oauthService = new ServiceBuilder()
					.apiKey(CLIENT_ID)
					.apiSecret(CLIENT_SECRET)
					.callback(REDIRECT_URI)
					.state(state)
					.build(NaverLoginApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	public String getUserProfile(OAuth2AccessToken oauthToken) throws Exception{
		OAuth20Service oauthService = new ServiceBuilder()
				.apiKey(CLIENT_ID)
				.apiSecret(CLIENT_SECRET)
				.callback(REDIRECT_URI)
				.build(NaverLoginApi.instance());
		OAuthRequest request = new OAuthRequest(Verb.GET,PROFILE_API_URL,oauthService);
		oauthService.signRequest(oauthToken, request);
		Response response = request.send();
		return response.getBody();
	}
}
