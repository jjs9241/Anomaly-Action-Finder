package org.zerock.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import lombok.extern.log4j.Log4j;

import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.net.URLDecoder;

import org.zerock.utils.JwtUtil;

import org.springframework.web.client.RestTemplate;

import java.net.URI;
import org.springframework.http.HttpEntity;
import java.util.Date;
import java.util.HashMap;

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
			
			String JWT_SECRET_KEY = "016D70400F07E9FC5F9A955B186119ED4F060EE9C9E22237897C6F49179275D1"; //"비밀키"
			JwtUtil jwtUtil = new JwtUtil(JWT_SECRET_KEY);
			RestTemplate restTemplate = new RestTemplate();
			
			String curUserId = SecurityContextHolder.getContext().getAuthentication().getName();
			Date curTime = new Date();
			SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			String timeStr = format.format(curTime);
			
			String flask0_URL = "http://localhost:5009";
			try {
				HttpSession session = req.getSession();
				String accessToken = jwtUtil.createToken(curUserId, timeStr);
				accessToken = URLDecoder.decode(accessToken, "UTF-8");
				log.warn(accessToken);
				session.setAttribute("token", accessToken);
				log.warn(session.getAttribute("token"));
				Map<String, String> params = new HashMap<String, String>();
				params.put("token", accessToken);
				URI location = restTemplate.postForLocation(flask0_URL + "/login", params);
			} catch(Exception e) {
				System.out.println("restTemplateError");
			}
			res.sendRedirect("/manageCCTV");
			return;
		}
		String errMsg = URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.","UTF-8");
		log.warn("errMsg : " + errMsg);
		res.sendRedirect("/login/login?errMsg="+errMsg);
	}
}
