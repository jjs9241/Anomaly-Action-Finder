package com.finder.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.finder.domain.JSONResult;

import org.springframework.security.core.Authentication;

import lombok.extern.log4j.Log4j;

import java.net.URLEncoder;
import java.net.URLDecoder;

@Log4j
public class CustomLoginSuccessHandler 
implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, 
			HttpServletResponse res, Authentication auth)
				throws IOException, ServletException {
		
		log.warn("Login Success");
		
//		SecurityUser securityUser = null;
//      if (SecurityContextHolder.getContext().getAuthentication() != null) {
//          Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//          if (principal != null && principal instanceof UserDetails) {
//              securityUser = (SecurityUser) principal;
//          }
//      }
		
		MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter();
        MediaType jsonMimeType = MediaType.APPLICATION_JSON;
		
		List<String> roleNames = new ArrayList<>();
		System.out.println("auth : "+auth);
		auth.getAuthorities().forEach(authority->{
			System.out.println("autority : "+authority);
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {
			res.sendRedirect("/adminPage");
			return;
		}
			
		if (roleNames.contains("ROLE_USER")) {
//			res.sendRedirect("/manageCCTV");
//			return;

	        JSONResult jsonResult = JSONResult.success(auth); 
	        if (jsonConverter.canWrite(jsonResult.getClass(), jsonMimeType)) {
	            jsonConverter.write(jsonResult, jsonMimeType, new ServletServerHttpResponse(res));
	        }
	        return;
		}
//		String errMsg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.","UTF-8");
//		log.warn("errMsg : " + errMsg);
//		res.sendRedirect("/login/login?errMsg="+errMsg);
//		res.sendRedirect("/login?errMsg="+errMsg);
	}
}
