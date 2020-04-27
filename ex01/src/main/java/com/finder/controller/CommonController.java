package com.finder.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import java.io.IOException;
import java.io.PrintWriter;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {

	/*@GetMapping("/accessError")
	public void accessDenied(HttpServletResponse res, HttpServletRequest req, Authentication auth, Model model) throws IOException {
		
		log.info("access Denied : " + auth);
		String url = req.getParameter("url");
		model.addAttribute("msg", "Access Denied");
		res.sendRedirect("/login/login?authError=True");
	}*/
	
//	@GetMapping("/customLogout")
//	public void logoutGet(HttpServletRequest req, 
//			HttpServletResponse res)
//					throws ServletException, IOException {
//		
//		log.info("custom logout");
//		res.sendRedirect("/");
//		
//	}
	
	@GetMapping("/cctv_test")
	public String cctv_test(HttpServletRequest req, 
			HttpServletResponse res)
					throws ServletException, IOException {
		
		return "cctv_test";
		
	}
	
	@GetMapping("/pushtest")
	public String pushTest(HttpServletRequest req, 
			HttpServletResponse res)
					throws ServletException, IOException {
		
		return "pushtest";
		
	}
	
	@RequestMapping(value = "/noticetoweb", method= RequestMethod.GET)
	public ModelAndView noticeToWeb(@RequestParam String message, HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter writer = res.getWriter();
		System.out.println("message : "+message);
		System.out.println("writer : "+writer);
		writer.println("<script>alert('해당 페이지에 대한 권한이 없습니다.'); location.href='/login';</script>");
		writer.flush();
		String referer = (String)req.getHeader("REFERER");
		System.out.println("referer : "+referer);
		System.out.println("res : "+res);
		ModelAndView mav = new ModelAndView();
		System.out.println("notice after flush");
		mav.setViewName("login");
		return mav;
	}
}
