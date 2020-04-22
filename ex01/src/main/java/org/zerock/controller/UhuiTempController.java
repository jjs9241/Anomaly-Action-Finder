package org.zerock.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Controller
public class UhuiTempController {
	
	private static final Logger logger = LoggerFactory.getLogger(UhuiTempController.class);
	
	
	@RequestMapping(value = "/strange", method = RequestMethod.GET)
	public String strange(Model model) throws Exception{		
		return "strange";
	}
	
	@RequestMapping(value = "/map", method = RequestMethod.GET)
	public String map(Model model) throws Exception{
			
		return "map";
		
	}
	
	@RequestMapping(value = "/qa", method = RequestMethod.GET)
	public String qa(Model model) throws Exception{			
		return "q&a";		
	}
}
