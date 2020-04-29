package com.finder.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import com.finder.util.StreamView;

import lombok.extern.java.Log;

@Controller
@Log
public class VideoStreamController {

	@Autowired
	StreamView streamView;
	

	
	
	@RequestMapping(value="/move/{fileName}", method=RequestMethod.GET)
	public View streamVideo(@PathVariable("fileName") String fileName, HttpServletRequest request,
							Model model){
		
		
		log.info("streamVideo filename : "+fileName);
		model.addAttribute("movieName", fileName+".mp4");
//		try {
//			Itinerary = planitService.getItineraryByID(itineraryID);
//			entity = new ResponseEntity<ItineraryVO>(Itinerary, HttpStatus.OK);
//		} catch (Exception e) {
//			entity = new ResponseEntity<ItineraryVO>(Itinerary, HttpStatus.BAD_REQUEST);
//			
//		}
//		return entity;
		return streamView;
	}
	
}
