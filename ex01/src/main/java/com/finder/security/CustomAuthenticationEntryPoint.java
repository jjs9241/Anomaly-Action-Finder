package com.finder.security;

import static com.finder.security.ViewHelper.convertorViewTypeErrorPage;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.stereotype.Component;

import com.finder.controller.ManageCCTVController;

@Component("authenticationEntryPoint")
public class CustomAuthenticationEntryPoint implements AuthenticationEntryPoint {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageCCTVController.class);
	
    private Boolean redirect =true;
    public Boolean getRedirect() {
        return redirect;
    }
    public void setRedirect(Boolean redirect) {
        this.redirect = redirect;
    }
 
    private String errorPage;
    public void setErrorPage(String errorPage) {
        this.errorPage = errorPage;
    }
    public String getErrorPage() {
        return errorPage;
    }
 
    @Override
    public void commence(HttpServletRequest request, HttpServletResponse response, AuthenticationException authException)throws IOException, ServletException {
        // 에러 페이지에 대한 확장자를 현재 호출한 확장자와 마추어준다.
    	logger.info("commence");
    	logger.info(errorPage);
    	String goErrorPage = convertorViewTypeErrorPage(request, errorPage);
    	logger.info(goErrorPage);
//    	response.sendRedirect("/login/login?authError=True");
    	response.sendRedirect("/login?authError=True");
        
    }
 
}
