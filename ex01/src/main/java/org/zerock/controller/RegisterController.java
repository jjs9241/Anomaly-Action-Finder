package org.zerock.controller;

import java.io.PrintWriter;
import java.text.DateFormat;

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
import org.zerock.domain.CCTVVO;
import org.zerock.domain.MemberVO;
import org.zerock.domain.StoreVO;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.zerock.service.MemberService;
import org.zerock.service.StoreService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Iterator;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.servlet.support.RequestContextUtils;
import org.zerock.security.domain.CustomUser;

@Controller
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageCCTVController.class);
	
	@Inject
	private StoreService storeService;
	
	@RequestMapping(value = "/registerStore", method = RequestMethod.GET)
	public ModelAndView registerStore(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		
		MemberVO member = new MemberVO();
		ModelAndView mav = new ModelAndView();
		String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
		member.setPid(currentUserName);
		logger.info(currentUserName);
		
		StoreVO store = new StoreVO();
		
		store.setPid(req.getParameter("field"));
		
		boolean success = false;
		
		try {
			success = storeService.register(store);
			
		} catch(Exception exception) {
			mav.setViewName("registerStore");
		}
		return mav;
	}
		
	@RequestMapping(value = "/registerStore", method = RequestMethod.POST)
	public ModelAndView postStore(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		ModelAndView mav = new ModelAndView();
		
		return mav;
		//req.setAttribute("storeList", storeList);
		//mav.addObject("storeList", storeList);
		
		/*logger.info(member.getPid());
		
		res.setContentType("text/html; charset=UTF-8");
		
		if (success) {
			PrintWriter out = res.getWriter();
        	 
        	out.println("<script>alert('매장이 등록 되었습니다'); location.href='/indexStore';</script>");
        	 
        	out.flush();
			mav.setViewName("indexStore");
		} else {
			PrintWriter out = res.getWriter();
        	 
        	out.println("<script>alert('등록할 수 없는 매장입니다.'); location.href='/registerStore';</script>");
        	 
        	out.flush();
        	
			mav.setViewName("registerStore");
		}
		
		return mav;*/
	}
	
	

}
