package org.zerock.security;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;

@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{

	@Override
	public void handle(HttpServletRequest req, HttpServletResponse res,
			AccessDeniedException accessException)
					throws IOException, ServletException {
		
		log.error("Access Denied Handler");
		log.error("Redirect....");
		// 직접 서블릿 API를 이용할 수 있다.
		res.sendRedirect("/accessError");
	}
}
