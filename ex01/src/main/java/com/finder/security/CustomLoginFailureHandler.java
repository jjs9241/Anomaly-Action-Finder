package com.finder.security;

import java.io.IOException;
import java.io.OutputStream;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finder.domain.JSONResult;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginFailureHandler 
implements AuthenticationFailureHandler{

//	@Override
//	public void onAuthenticationSuccess(HttpServletRequest req, 
//			HttpServletResponse res, Authentication auth)
//				throws IOException, ServletException {
//		
//		log.warn("Login Success");
//		
//		List<String> roleNames = new ArrayList<>();
//		auth.getAuthorities().forEach(authority->{
//			roleNames.add(authority.getAuthority());
//		});
//		
//		log.warn("ROLE NAMES: " + roleNames);
//		
//		if (roleNames.contains("ROLE_ADMIN")) {
//			res.sendRedirect("/adminPage");
//			return;
//		}
//		
//		if (roleNames.contains("ROLE_USER")) {
//			res.sendRedirect("/manageCCTV");
//			return;
//		}
//		String errMsg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.","UTF-8");
//		log.warn("errMsg : " + errMsg);
////		res.sendRedirect("/login/login?errMsg="+errMsg);
//		res.sendRedirect("/login?errMsg="+errMsg);
//	}

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		
		//간단한 json 응답 처리
//		ObjectMapper om = new ObjectMapper();
//		Map<String, Object> map = new HashMap<String, Object>();
//		map.put("success", false);
//		map.put("message", exception.getMessage());
//
//		// {"success" : false, "message" : "..."}
//		String jsonString = om.writeValueAsString(map);
//
//		OutputStream out = response.getOutputStream();
//		out.write(jsonString.getBytes());
		
		//응답 json 객체 생성
		MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter();
        MediaType jsonMimeType = MediaType.APPLICATION_JSON;
        
        String errMsg = "아이디 또는 비밀번호가 일치하지 않습니다.";
        
        //에러 메세지 및 result fail 처리
		JSONResult jsonResult = JSONResult.fail(errMsg);
		
		if (jsonConverter.canWrite(jsonResult.getClass(), jsonMimeType)) {
		    jsonConverter.write(jsonResult, jsonMimeType, new ServletServerHttpResponse(response));
		}
		return;
	}
}
