package com.finder.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import com.finder.controller.LoginController;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{
	
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Override
	public void handle(HttpServletRequest req, HttpServletResponse res,
			AccessDeniedException accessException)
					throws IOException, ServletException {
		
		String url = req.getRequestURI();
		logger.info("url: ", url);
		
		log.error("Access Denied Handler");
		log.error("Redirect....");
//		res.sendRedirect("/login/login?authError=True");
		res.sendRedirect("/login?authError=True");
		// 직접 서블릿 API를 이용할 수 있다.
		//res.sendRedirect("/accessError?url="+url);
	}
}
