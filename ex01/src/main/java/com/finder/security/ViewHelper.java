package com.finder.security;

import javax.servlet.http.HttpServletRequest;

public class ViewHelper {
	
	public static String convertorViewTypeErrorPage(HttpServletRequest request, String errPage) {
		return "/login/login?authError=True";
	}

}
