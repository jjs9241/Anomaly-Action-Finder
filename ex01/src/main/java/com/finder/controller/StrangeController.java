package com.finder.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.finder.domain.VideoVO;
import com.finder.mapper.StrangeMapper;
import com.finder.mapper.VideoMapper;

import lombok.extern.java.Log;

@Controller
@Log
public class StrangeController {

	@Autowired
	VideoMapper vdMapper;
	
	@Autowired
	StrangeMapper stMapper;
	
	@RequestMapping(value = "/strange", method = RequestMethod.GET)
	public String strange(Model model) throws Exception{		
		return "strange";
	}
	
	@RequestMapping(value = "/strange/list", method = RequestMethod.GET)
	public ResponseEntity<List<VideoVO>> strangeList(Model model) throws Exception{	
		
		String curUserId = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info("StrangeController userID : "+curUserId);
		
		try {
			List<VideoVO> voList = vdMapper.getVideoListByManagerID(curUserId);
			log.info("vo : "+voList);
			return new ResponseEntity<List<VideoVO>>(voList,HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<List<VideoVO>>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@RequestMapping(value = "/strange/bookmark", method = RequestMethod.POST)
	public ResponseEntity<HttpStatus> updateBookmark(@RequestBody VideoVO videoVO, Model model, HttpSession session ) throws Exception{	
		
		String curUserId = SecurityContextHolder.getContext().getAuthentication().getName();
		log.info("StrangeController userID : "+curUserId);
		log.info("StrangeController videoVO : "+videoVO);
		
		videoVO.setManagerID(curUserId);
		
		try {
			stMapper.updateBookmark(videoVO);
			return new ResponseEntity<HttpStatus>(HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
		}
	}
	

	

	
	
	
}
