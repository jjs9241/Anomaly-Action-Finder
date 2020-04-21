package org.zerock.controller;

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
import org.zerock.domain.MemberVO;

import javax.inject.Inject;

import org.springframework.web.bind.annotation.ModelAttribute;

import org.zerock.service.MemberService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.util.List;
import java.util.Iterator;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import org.springframework.web.servlet.support.RequestContextUtils;
import org.zerock.security.domain.CustomUser;

import org.zerock.domain.StoreVO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class ManageCCTVController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManageCCTVController.class);
	
	@Inject
	MemberService memberService;
	
	@RequestMapping(value = "/manageCCTV", method = RequestMethod.GET)
	public ModelAndView manageCCTV(Model map, HttpServletRequest req, HttpServletResponse res, HttpSession session) throws Exception {
		
		//Map<String,?> flashMap = RequestContextUtils.getInputFlashMap(req);
		
		//CustomUser userDetails = (CustomUser)SecurityContextHolder.getContext().getAuthentication().getDetails();
        
		MemberVO vo = new MemberVO();
		ModelAndView mav = new ModelAndView();
		String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
		vo.setPid(currentUserName);
		logger.info(currentUserName);
		
		//String userid = userDetails.getUserid();
		//vo.setPid(userid);
		
		//List<String> urlList = memberService.getURLList(vo);
		List<StoreVO> storeList = memberService.getStoreList(vo);
		List<List> urlListList = new ArrayList<List>();
		
		for(int i=0;i<storeList.size();i++) {
			List<String> urlList = storeList.get(i).getCctvUrlList();
			for(int j=0; j < urlList.size(); j++) {
				urlList.set(j, "http://"+ urlList.get(j) + "/video_feed");
			}
			urlListList.add(urlList);
		}
		
		req.setAttribute("urlListList", urlListList);
		mav.addObject("urlListList", urlListList);
		/*
		if(flashMap != null) {
			Iterator<String> iter = flashMap.keySet().iterator();
			while(iter.hasNext()) {
				logger.info((String)flashMap.get(iter.next()));
			}
			vo.setPid((String)flashMap.get("flashMemberId"));
			List<String> urlList = memberService.getURLList(vo);
			req.setAttribute("urlList", urlList);
			mav.addObject("urlList", urlList);
		}*/
		//vo.setPid((String)req.getAttribute("id"));
		//vo.setPid((String)map.asMap().get("flashMemberId"));
		
		logger.info(vo.getPid());
		
		mav.setViewName("manageCCTV");
		
		return mav;
	}

}
