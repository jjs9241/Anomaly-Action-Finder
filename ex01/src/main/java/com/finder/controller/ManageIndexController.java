package com.finder.controller;

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

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;

import com.finder.domain.CCTVVO;
import com.finder.domain.MemberVO;
import com.finder.domain.StoreVO;
import com.finder.security.domain.CustomUser;
import com.finder.service.MemberService;
import com.finder.service.StoreService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Iterator;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.servlet.support.RequestContextUtils;

@Controller
public class ManageIndexController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageCCTVController.class);
	
	@Inject
	MemberService memberService;
	
	@Inject
	StoreService storeService;
	
	@RequestMapping(value = "/indexStore", method = RequestMethod.GET)
	public ModelAndView indexStore(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		
		MemberVO member = new MemberVO();
		ModelAndView mav = new ModelAndView();
		String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
		member.setPid(currentUserName);
		logger.info(currentUserName);
		
		List<StoreVO> storeList = memberService.getStoreList(member);
		/*for(int i=0;i<storeList.size();i++) {
			storeList.get(i).setIp("http://"+ storeList.get(i) + "/video_feed");
		}*/
		req.setAttribute("storeList", storeList);
		mav.addObject("storeList", storeList);
		
		logger.info(member.getPid());
		
		mav.setViewName("indexStore");
		
		return mav;
	}
	
	/*
	@RequestMapping(value = "/indexCCTV", method = RequestMethod.GET)
	public ModelAndView indexCCTV(HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		
		StoreVO store = new StoreVO();
		ModelAndView mav = new ModelAndView();
		String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
		String storeId = req.getParameter("storeId");
		
		if (currentUserName != storeService.getManagerId(storeId)) {
			mav.setViewName("indexStore");
			res.setContentType("text/html; charset=UTF-8");
			PrintWriter writer = res.getWriter();
			writer.println("<script>alert('해당 스토어에 대한 권한이 없습니다.'); location.href='/indexStore';</script>");
			writer.flush();
			return mav;
		}
		store.setPid(storeId);
		logger.info(currentUserName);		
		List<CCTVVO> cctvList = storeService.getCCTVList(store);
		*/
		/*
		for(int i=0;i<cctvList.size();i++) {
			cctvList.set(i, "http://"+ cctvList.get(i) + "/video_feed");
		}*/
	/*
		req.setAttribute("cctvList", cctvList);
		mav.addObject("cctvList", cctvList);
		logger.info(store.getPid());
		
		mav.setViewName("indexCCTV");
		
		return mav;
	}*/
}
