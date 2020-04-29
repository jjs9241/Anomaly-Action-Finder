package com.finder.controller;

import java.io.PrintWriter;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpSession;

//import java.text.DateFormat;
//import java.util.Date;
//import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.finder.domain.AuthVO;
import com.finder.domain.CCTVVO;
import com.finder.domain.MemberVO;
import com.finder.domain.StoreVO;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.finder.service.MemberService;
import com.finder.service.StoreService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Iterator;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.servlet.support.RequestContextUtils;
import com.finder.security.domain.CustomUser;

@Controller
@RequestMapping("/join/*")
public class JoinController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageCCTVController.class);
	
	@Inject
	private MemberService memberService;
	
	@RequestMapping(value = "user", method = RequestMethod.GET)
	public ModelAndView joinPage(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {

		ModelAndView mav = new ModelAndView();
		
		String errMsg = "";
		
		mav.setViewName("join");

		return mav;
	}
	
	@RequestMapping(value = "user", method = RequestMethod.POST)
	public ModelAndView joinUser(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {

		MemberVO member = new MemberVO();
		ModelAndView mav = new ModelAndView();
		
		member.setPid(req.getParameter("email"));
		member.setEmail(req.getParameter("email"));
		System.out.println("email:" + member.getEmail());
		member.setPasswd(req.getParameter("pw"));
		System.out.println("pw:" + member.getPasswd());
		member.setPhoneNumber(req.getParameter("number"));
		System.out.println("phone number:" + member.getPhoneNumber());
		List authList = new ArrayList<AuthVO>();
		AuthVO auth = new AuthVO();
		auth.setAuth("ROLE_USER");
		authList.add(auth);
		member.setAuthList(authList);
		
		boolean success = false;
		
		try {
			success = memberService.join(member);
			
		} catch(Exception exception) {
			logger.info("join user error!", member.getPid());
			mav.setViewName("join/user");
		}
		
		//req.setAttribute("storeList", storeList);
		//mav.addObject("storeList", storeList);
		
		logger.info(member.getPid());
		
		res.setContentType("text/html; charset=UTF-8");
		
		if (success) {
			PrintWriter out = res.getWriter();
        	 
        	out.println("<script>alert('회원가입에 성공했습니다.'); location.href='/manageCCTV';</script>");
        	 
        	out.flush();
			mav.setViewName("join");//manageCCTV");
		} else {
			PrintWriter out = res.getWriter();
        	 
        	out.println("<script>alert('회원가입에 실패했습니다.'); location.href='/join/user';</script>");
        	 
        	out.flush();
        	
			mav.setViewName("join");
		}

		return mav;
	}
	
}
