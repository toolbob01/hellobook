package com.hellobook.controller;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.hellobook.utility.TranslateVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RestController
@RequestMapping("/translate/")
public class TranslateController {

	String clientId = "5yFSVlvtJeavfWNSX2Xq";
	String clientSecret = "UmQKium3q0";
	
	public String translate(String sentence,String inLang, String outLang) {
		String result = "";
		try {
			String text = URLEncoder.encode(sentence, "UTF-8");
			String apiURL = "https://openapi.naver.com/v1/papago/n2mt";
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setRequestMethod("POST");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			String postParams = "source="+inLang+"&target="+outLang+"&text="+text;
			con.setDoOutput(true);
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			wr.writeBytes(postParams);
			wr.flush();
			wr.close();
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if(responseCode==200) { // 정상적으로 호출되었을 때
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			}else { // 에러가 발생했을 때
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			
			String inputLine;
			StringBuffer response = new StringBuffer();
			while((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
			String responseText = response.toString();
			result = responseText;
		}catch(Exception e) {
			log.info(e);
			result = "Error!";
		}
		
		return result;
	}
	
	@PostMapping(value = "/translate", consumes = "application/json", produces = "application/json; charset=utf-8")
	public ResponseEntity<String> getTranslate(@RequestBody TranslateVO tvo){
		log.info("------------------------------");
		log.info(tvo);
		log.info("------------------------------");
		
		String text = translate(tvo.getText(),tvo.getInLang(),tvo.getOutLang());
		
		
		log.info("-----------번역된 글-----------");
		log.info(text);
		log.info("------------------------------");
		return new ResponseEntity<>(text,HttpStatus.OK);
	}
}
