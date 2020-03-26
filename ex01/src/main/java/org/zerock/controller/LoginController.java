package org.zerock.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping("login.do")
	public String login() {
		
		return "login"; // views/login.jsp 로 포워드
	}
	
	@RequestMapping("loginCheck.do")
	public ModelAndView loginCheck(@ModelAttribute MemberVO vo, HttpSession session) {
		
		boolean result = memberService.loginCheck(vo, session);
		ModelAndView mav = new ModelAndView();
		if (result == true) { // 로그인 성공
			mav.setViewName(""); // home.jsp 로 이동
			mav.addObject("msg", "success");
		} else { // 로그인 실패
			mav.setViewName("login"); // login.jsp 로 이동
			mav.addObject("msg", "failure");
		}
		return mav;
	}
	
	@RequestMapping("logout.do")
	public ModelAndView logout(HttpSession session) {
		memberService.logout(session);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		mav.addObject("msg", "logout");
		return mav;
	}
}
