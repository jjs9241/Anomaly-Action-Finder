package com.finder.security;

import java.io.IOException;
import java.net.URI;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.MediaType;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.http.server.ServletServerHttpResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.web.client.RestTemplate;

import com.finder.domain.JSONResult;
import com.finder.utils.JwtUtil;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomLoginSuccessHandler 
implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, 
			HttpServletResponse response, Authentication auth)
				throws IOException, ServletException {
		
		log.warn("Login Success");
		
//		SecurityUser securityUser = null;
//      if (SecurityContextHolder.getContext().getAuthentication() != null) {
//          Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//          if (principal != null && principal instanceof UserDetails) {
//              securityUser = (SecurityUser) principal;
//          }
//      }
		
		//응답 json 객체 생성
		MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter();
        MediaType jsonMimeType = MediaType.APPLICATION_JSON;
		
        //응답할 data를 담을 map
        Map<String, Object> resultMap = new HashMap<String, Object>();
        
//		List<String> roleNames = new ArrayList<>();
//		System.out.println("auth : "+auth);
//		auth.getAuthorities().forEach(authority->{
//			System.out.println("autority : "+authority);
//			roleNames.add(authority.getAuthority());
//		});
		
//		log.warn("ROLE NAMES: " + roleNames);
		
        //auth 객체에서 권한 목록 가져오기
		String roleNames = auth.getAuthorities().toString();
		
//		if (roleNames.contains("ROLE_ADMIN")) {
//			response.sendRedirect("/adminPage");
//			return;
//		}
			
		if (roleNames.contains("ROLE_USER")) {
//			response.sendRedirect("/manageCCTV");
//			return;
			
			String JWT_SECRET_KEY = "016D70400F07E9FC5F9A955B186119ED4F060EE9C9E22237897C6F49179275D1"; //"비밀키"
			JwtUtil jwtUtil = new JwtUtil(JWT_SECRET_KEY);
			RestTemplate restTemplate = new RestTemplate();
			
			String curUserId = SecurityContextHolder.getContext().getAuthentication().getName();
			Date curTime = new Date();
			SimpleDateFormat format = new SimpleDateFormat ("yyyy-MM-dd HH:mm:ss");
			String timeStr = format.format(curTime);
			
			String flask0_URL = "http://localhost:5009";
			try {
				HttpSession session = request.getSession();
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
			
			//로그인 후 이동할 페이지 URI
//			resultMap.put("moveURI", "/manageCCTV");
			resultMap.put("moveURI", "/stores");
	        JSONResult jsonResult = JSONResult.success(resultMap); 
	        if (jsonConverter.canWrite(jsonResult.getClass(), jsonMimeType)) {
	            jsonConverter.write(jsonResult, jsonMimeType, new ServletServerHttpResponse(response));
	        }
	        return;
		}
//		String errMsg = URLEncoder.encode("주어진 권한이 없는 사용자입니다.","UTF-8");
//		log.warn("errMsg : " + errMsg);
//		res.sendRedirect("/login/login?errMsg="+errMsg);
//		res.sendRedirect("/login?errMsg="+errMsg);
	}
}
