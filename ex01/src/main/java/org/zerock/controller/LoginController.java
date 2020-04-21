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

import org.springframework.web.bind.annotation.RequestMethod;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Map;
import java.net.URLEncoder;
import java.io.PrintWriter;
import java.net.URLDecoder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;
import org.springframework.web.servlet.FlashMap;

import org.springframework.security.core.userdetails.UserDetailsService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	@Inject
	MemberService memberService;
	
	
	@RequestMapping("login.do")
	public String loginDo() {
		
		return "login"; // views/login.jsp 로 포워드
	}
	
	@RequestMapping(value = "/fail", method= RequestMethod.GET)
	public void loginFail(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		String errMsg = "아이디 또는 비밀번호가 일치하지 않습니다.";
		
		errMsg = URLEncoder.encode(errMsg,"UTF-8");
		res.sendRedirect("http://localhost:8080/login/login?errMsg=" + errMsg);
		
	}
	
	@RequestMapping(value = "/login", method= RequestMethod.GET)
	public ModelAndView loginPage(HttpServletRequest req, HttpServletResponse res) throws Exception {
	
		ModelAndView mav = new ModelAndView();
		//String errMsg = URLEncoder.encode(req.getParameter("errMsg"),"UTF-8");
		String errMsg = req.getParameter("errMsg");
		String authError = req.getParameter("authError");
		
		if(errMsg != null) {
			//errMsg = URLEncoder.encode(errMsg,"UTF-8");
			logger.info(errMsg);
			req.setAttribute("errMsg", URLDecoder.decode(errMsg,"UTF-8"));
			mav.addObject("errMsg", URLDecoder.decode(errMsg,"UTF-8"));
		}
		
		if(authError != null) {
			logger.info(authError);
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = res.getWriter();
			writer.println("<script>alert('해당 페이지에 대한 권한이 없습니다.'); location.href='/login/login';</script>");
			writer.flush();
		}
		logger.info("get login");
		
		mav.setViewName("login");
		return mav;
	}
	
	/*
	@RequestMapping(value = "/login", method= RequestMethod.POST)
	public void loginOk(@ModelAttribute MemberVO vo, HttpServletRequest req, HttpServletResponse res, RedirectAttributes rttr) throws Exception {
		
		logger.info("post login");
		
		//HttpSession session = req.getSession();
		logger.info(vo.getPid());
		
		MemberVO loginVO = memberService.viewMember(vo);
		
		if(loginVO == null) {
			logger.info("loginVO is null");
			res.sendRedirect("http://localhost:8080/login/login?errMsg=" + URLEncoder.encode("아이디 또는 비밀번호가 일치하지 않습니다.","UTF-8"));
		} else {
			logger.info("loginVO is " + vo.getPid());
			
			//rttr.addFlashAttribute("flashMemberId", vo.getPid());
			
			res.sendRedirect("http://localhost:8080/manageCCTV");
		}
	}*/
	
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
