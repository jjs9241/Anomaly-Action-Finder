package com.finder.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.finder.domain.MemberVO;
import com.finder.domain.StoreVO;
import com.finder.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class MapController {

	@Inject
	MemberService memberService;
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public ModelAndView map(HttpServletRequest req, HttpServletResponse res, HttpSession session, Model model) throws Exception{
		
		
		MemberVO member = new MemberVO();
		ModelAndView mav = new ModelAndView();
		String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
		member.setPid(currentUserName);
		
		List<StoreVO> storeList = memberService.getStoreList(member);
		/*for(int i=0;i<storeList.size();i++) {
			storeList.get(i).setIp("http://"+ storeList.get(i) + "/video_feed");
		}*/
//		req.setAttribute("storeList", storeList);
		
		ObjectMapper om = new ObjectMapper();
		String jsonString = om.writeValueAsString(storeList);

		mav.addObject("userid",currentUserName);
		mav.addObject("jsonStoreList", jsonString);
		mav.addObject("storeList", storeList);
		
		log.info(member.getPid());
		
		mav.setViewName("map");
		
		return mav;
		
	}
	

	@RequestMapping(value = "/map/list", method = RequestMethod.GET)
	public ResponseEntity<List<StoreVO>> searchGym(HttpServletRequest request) {
		ResponseEntity<List<StoreVO>> entity = null;
		
		 HttpSession session = request.getSession();

		 MemberVO member = new MemberVO();
		 
		 String currentUserName = SecurityContextHolder.getContext().getAuthentication().getName();
		 member.setPid(currentUserName);
		
		 List<StoreVO> storeList = memberService.getStoreList(member);
		
		try{
			entity = new ResponseEntity<List<StoreVO>>(storeList, HttpStatus.OK);
		} catch(Exception e){
			entity = new ResponseEntity<List<StoreVO>>(HttpStatus.BAD_REQUEST);
		}
		return entity;
	}
	
}
