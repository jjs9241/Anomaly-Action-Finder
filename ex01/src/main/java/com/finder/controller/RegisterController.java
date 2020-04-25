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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;

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
public class RegisterController {
	
	private static final Logger logger = LoggerFactory.getLogger(RegisterController.class);
	
	@Inject
	private StoreService storeService;
	
	static String md5(String s) {
        java.security.MessageDigest md;
        try { md = java.security.MessageDigest.getInstance("MD5"); }
        catch (Exception e) { return null; }
        md.update(s.getBytes());
        String result = (new java.math.BigInteger(1, md.digest())).toString(16);
        while(result.length()<32) { result = "0" + result; }
        return result;
    }
	
	@RequestMapping(value = "/registerStore", method = RequestMethod.GET)
	public ModelAndView registerStore(HttpServletRequest req, HttpServletResponse res, HttpSession session, Authentication auth, @RequestParam String no) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		logger.info("no : "+no);
		
//		store.setPid(req.getParameter("field"));
		
		mav.addObject("no", no);
		mav.setViewName("registerStore");
		return mav;
	}
		
	@RequestMapping(value = "/registerStore", method = RequestMethod.POST)
	public void postStore(StoreVO storeVO,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, Authentication auth) throws Exception {

		
//		logger.info("storeVO : "+storeVO);
//		logger.info("storeVO : "+new String(storeVO.getStoreName().getBytes("8859_1"),"utf-8"));
//		logger.info("storeVO : "+storeVO.getIp());
//		logger.info("storeVO : "+new String(storeVO.getAddress().getBytes("8859_1"),"utf-8"));
//		logger.info("storeVO.getStoreName() : "+new String(StringUtils.is .nvl().getBytes("8859_1"),"utf-8"));
		
		storeVO.setStoreName(new String(storeVO.getStoreName().getBytes("8859_1"),"utf-8"));
		storeVO.setAddress(new String(storeVO.getAddress().getBytes("8859_1"),"utf-8"));
		storeVO.setPid(md5(storeVO.getStoreName()));
		storeVO.setManagerId(auth.getName());
//		logger.info("md5 : "+md5(storeVO.getStoreName()));
		
		logger.info("after storeVO : "+storeVO);
		
		try {
			storeService.register(storeVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		res.sendRedirect("/stores");
		//req.setAttribute("storeList", storeList);
		//mav.addObject("storeList", storeList);
		
		/*logger.info(member.getPid());
		
		res.setContentType("text/html; charset=UTF-8");
		
		if (success) {
			PrintWriter out = res.getWriter();
        	 
        	out.println("<script>alert('매장이 등록 되었습니다'); location.href='/stores';</script>");
        	 
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
	
	@RequestMapping(value = "/registerCCTV", method = RequestMethod.GET)
	public ModelAndView registerCCTVpage( @RequestParam String no,
			 							 @RequestParam String storeId,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, Authentication auth) throws Exception {
		
		ModelAndView mav = new ModelAndView();
		logger.info("no : "+no);
		
//		store.setPid(req.getParameter("field"));
		
		mav.addObject("no", no);
		mav.addObject("cctvId", md5(no+storeId));
		mav.addObject("storeId", storeId);
		mav.setViewName("registerCCTV");
		return mav;
	}
		
	@RequestMapping(value = "/registerCCTV", method = RequestMethod.POST)
	public void registerCCTV(CCTVVO cctvVO,
			HttpServletRequest req, HttpServletResponse res, HttpSession session, Authentication auth) throws Exception {

		
//		logger.info("storeVO : "+storeVO);
//		logger.info("storeVO : "+new String(storeVO.getStoreName().getBytes("8859_1"),"utf-8"));
//		logger.info("storeVO : "+storeVO.getIp());
//		logger.info("storeVO : "+new String(storeVO.getAddress().getBytes("8859_1"),"utf-8"));
//		logger.info("storeVO.getStoreName() : "+new String(StringUtils.is .nvl().getBytes("8859_1"),"utf-8"));
		
		cctvVO.setDescription(new String(cctvVO.getDescription().getBytes("8859_1"),"utf-8"));
//		storeVO.setManagerId(auth.getName());
//		logger.info("md5 : "+md5(storeVO.getStoreName()));
		
		logger.info("after storeVO : "+cctvVO);
		
		try {
			storeService.registCCTV(cctvVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		res.sendRedirect("/stores");
		//req.setAttribute("storeList", storeList);
		//mav.addObject("storeList", storeList);
		
		/*logger.info(member.getPid());
		
		res.setContentType("text/html; charset=UTF-8");
		
		if (success) {
			PrintWriter out = res.getWriter();
        	 
        	out.println("<script>alert('매장이 등록 되었습니다'); location.href='/stores';</script>");
        	 
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
