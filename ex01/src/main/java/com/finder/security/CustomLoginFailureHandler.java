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

import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

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
		
		ObjectMapper om = new ObjectMapper();
		System.out.println("#### 실패 핸들러 ####");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("success", false);
		map.put("message", exception.getMessage());

		// {"success" : false, "message" : "..."}
		String jsonString = om.writeValueAsString(map);

		OutputStream out = response.getOutputStream();
		out.write(jsonString.getBytes());


		
	}
}
