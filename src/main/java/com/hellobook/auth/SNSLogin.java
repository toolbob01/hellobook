package com.hellobook.auth;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class SNSLogin {
	private OAuth20Service oauthService;
	private String profileUrl;
	
	public SNSLogin(SnsValue sns) {//해당 타입으로 service하나 만들기
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile email")
				.build(sns.getApi20Instance());			
		
		this.profileUrl = sns.getProfileUrl();
	}

	public String getUserProfile(String code) throws Exception{
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		System.out.println("accessToken: "+accessToken);
		OAuthRequest request = new OAuthRequest(Verb.GET, this.profileUrl);
		System.out.println("request: "+request);
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);

		System.out.println("response: "+response);
		return response.getBody();
	}
}
