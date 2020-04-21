package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
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
		
		List<String> roleNames = new ArrayList<>();
		auth.getAuthorities().forEach(authority->{
			roleNames.add(authority.getAuthority());
		});
		
		log.warn("ROLE NAMES: " + roleNames);
		
		if (roleNames.contains("ROLE_ADMIN")) {
			res.sendRedirect("/adminPage");
			return;
		}
		
		if (roleNames.contains("ROLE_USER")) {
			res.sendRedirect("/manageCCTV");
			return;
		}
		String errMsg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.","UTF-8");
		log.warn("errMsg : " + errMsg);
		res.sendRedirect("/login/login?errMsg="+errMsg);
	}
}
